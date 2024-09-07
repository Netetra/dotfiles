#!/bin/bash

set -euC

rm -f /etc/environment
cat "$(pwd)"/etc/environment > /etc/environment

rm -rf /etc/sddm.conf.d
cp -rf "$(pwd)"/etc/sddm.conf.d /etc/sddm.conf.d

rm -rf /etc/modprobe.d
cp -rf "$(pwd)"/etc/modprobe.d /etc/modprobe.d

rm -rf /etc/sysctl.d
cp -rf "$(pwd)"/etc/sysctl.d /etc/sysctl.d
