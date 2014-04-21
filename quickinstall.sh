#!/bin/bash
sudo apt-get update
sudo apt-get install vim python-pip python-dev build-essential python-serial libpcre3 libpcre3-dev
sudo pip install --upgrade pip
sudo pip install --upgrade virtualenv
sudo pip install pillow qrcode pycrypto scrypt slowaes ecdsa
sudo sed -i '$ d' /etc/inittab
sudo sed -e "s/console=ttyAMA0,115200 kgdboc=ttyAMA0,115200 //g" -i.backup /boot/cmdline.txt
git clone https://github.com/adafruit/Python-Thermal-Printer.git
git clone https://github.com/ryanralph/Piper.git
git clone https://github.com/piperwallet/vanitygen.git
cd vanitygen/
make
cp vanitygen ../Piper/
cd ../Piper

