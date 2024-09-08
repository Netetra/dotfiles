#!/bin/bash

set -euC

rm data/packages.txt
pacman -Qe > data/packages.txt
