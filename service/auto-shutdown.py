#!/usr/bin/env python3

import glob
import os
import subprocess
import time
import logging
from pathlib import Path

LOW_BATTERY = 3
COUNTDOWN = 180
CHECK_INTERVAL = 30
UPDATE_INTERVAL = 1

APP_NAME = "Auto shutdown"
NOTIFICATION_TITLE = "バッテリー残量低下"

logging.basicConfig(level=logging.INFO, format="%(asctime)s [%(levelname)s] %(message)s")

def get_battery():
  batteries = glob.glob("/sys/class/power_supply/BAT*")

  if not batteries:
    raise RuntimeError("Battery not found")

  total_energy = 0
  total_full = 0
  charging = False
  discharging = False

  for battery in batteries:
    path = Path(battery)
    status_file = path / "status"
    capacity_file = path / "capacity"
    if not status_file.exists():
      continue

    status = status_file.read_text().strip()

    if status == "Charging":
      charging = True
    if status == "Discharging":
      discharging = True

    energy_now = path / "energy_now"
    energy_full = path / "energy_full"

    if energy_now.exists() and energy_full.exists():
      total_energy += int(energy_now.read_text())
      total_full += int(energy_full.read_text())

  if total_full > 0:
    capacity = round(total_energy / total_full * 100)
  else:
    capacity = int(Path(batteries[0], "capacity").read_text())

  return {
    "capacity": capacity,
    "charging": charging,
    "discharging": discharging,
  }

def notify(title, message, progress=None, notification_id=None):
  command = [
    "notify-send",
    "--app-name", APP_NAME,
    "--urgency", "critical",
    "--expire-time", "0",
    "--print-id"
  ]

  if notification_id is not None:
    command.extend([
        "--replace-id", str(notification_id)
    ])
  if progress is not None:
    command.extend([
        "--hint", f"int:value:{progress}"
    ])

  command.extend([title, message])

  result = subprocess.run(
    command,
    capture_output=True,
    text=True
  )

  if notification_id is None and result.returncode == 0:
    try:
      return int(result.stdout.strip())
    except ValueError:
      pass

  return notification_id


def dismiss_notification(notification_id):
  if notification_id is not None:
    subprocess.run(
      ["makoctl", "dismiss", "-n", str(notification_id)],
      stdout=subprocess.DEVNULL,
      stderr=subprocess.DEVNULL
    )

def countdown():
  logging.warning("Low battery detected.")
  notification_id = None

  for remaining in range(COUNTDOWN, -1, -1):
    battery = get_battery()
    capacity = battery["capacity"]

    if not battery["discharging"]:
      logging.info("External power detected. Cancelled.")
      notify(
          "自動シャットダウン解除",
          "外部電源を検出したため中断します。",
      )
      dismiss_notification(notification_id)
      return

    progress = int(
      remaining / COUNTDOWN * 100
    )

    minutes, seconds = divmod(remaining, 60)

    message = (
      f"残量: {capacity}%\n"
      f"自動シャットダウンまで: "
      f"{minutes:02d}:{seconds:02d}"
    )

    notification_id = notify(
      NOTIFICATION_TITLE,
      message,
      progress,
      notification_id
    )

    if remaining == 0:
      break

    time.sleep(UPDATE_INTERVAL)

  logging.warning("Battery critical. Shutting down.")
  subprocess.run(["systemctl", "poweroff"])

def main():
  logging.info("Auto shutdown service started.")
  while True:
    try:
      battery = get_battery()
      capacity = battery["capacity"]
      discharging = battery["discharging"]
      logging.debug("Battery: %s%%, discharging=%s", capacity, discharging)
      if discharging and capacity <= LOW_BATTERY:
        countdown()
    except Exception:
      logging.exception("Battery monitoring error")
    time.sleep(CHECK_INTERVAL)

if __name__ == "__main__":
  main()
