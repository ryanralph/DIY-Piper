#!/bin/bash
sudo sed -i '$ d' /etc/inittab
sudo sed -e "s/console=ttyAMA0,115200 kgdboc=ttyAMA0,115200 //g" -i.backup /boot/cmdline.txt
git clone https://github.com/adafruit/Python-Thermal-Printer.git

