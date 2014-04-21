#!/bin/bash
apt-get update
apt-get install git python-pip python-dev build-essential python-serial libpcre3 libpcre3-dev
pip install --upgrade pip
pip install --upgrade virtualenv
pip install pillow qrcode pycrypto scrypt slowaes ecdsa
sed -i '$ d' /etc/inittab
sed -e "s/console=ttyAMA0,115200 kgdboc=ttyAMA0,115200 //g" -i.backup /boot/cmdline.txt
git clone https://github.com/adafruit/Python-Thermal-Printer.git
git clone https://github.com/ryanralph/Piper.git
git clone https://github.com/piperwallet/vanitygen.git
cd vanitygen/
make
cp vanitygen ../Piper/
cd ../Piper

