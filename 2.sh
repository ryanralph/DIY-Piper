#!/bin/bash
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

