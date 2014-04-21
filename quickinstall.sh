#!/bin/bash
sudo apt-get update
sudo apt-get install vim python-pip python-dev build-essential python-serial libpcre3 libpcre3-dev python-qt4
sudo pip install --upgrade pip
sudo pip install --upgrade virtualenv
sudo pip install pillow
sudo pip install qrcode
sudo pip install pycrypto
sudo pip install scrypt
sudo pip install ecdsa
sudo pip install --pre slowaes
sudo sed -i '$ d' /etc/inittab
sudo sed -e "s/console=ttyAMA0,115200 kgdboc=ttyAMA0,115200 //g" -i.backup /boot/cmdline.txt
git clone https://github.com/adafruit/Python-Thermal-Printer.git
cd Python-Thermal-Printer/
python printertest.py
cd ..
git clone https://github.com/ryanralph/Piper.git
cp -f Python-Thermal-Printer/Adafruit_Thermal.py Piper/
sed -e "s/import Image/from PIL import Image/g" -i.backup Piper/Adafruit_Thermal.py
sed -e "s/.\/vanitygen/.\/home\/pi\/DIY-Piper\/vanitygen/g" -i.backup Piper/genkeys.py
sed -e "s/\"Images\/\"/\"/home\/pi\/DIY-Piper\/Images\/\"/g" -i.backup Piper/piper.py
git clone https://github.com/piperwallet/vanitygen.git
cd vanitygen/
make
cd ..
cp vanitygen/vanitygen Piper/
mv vanitygen/ vanitygenfolder/
mv Piper/* .
sudo sh -c "echo sudo python /home/pi/DIY-Piper/runner.py \& >> /etc/rc.local"
sudo cp DIYPiper /etc/init.d/
sudo /etc/init.d/DIYPiper start

