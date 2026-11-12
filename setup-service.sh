#!/bin/bash

set -euC

mkdir -p ~/.local/bin
cp ./service/auto-shutdown.py ~/.local/bin/auto-shutdown.py
chmod +x ~/.local/bin/auto-shutdown.py

systemctl --user enable --now auto-shutdown.service
