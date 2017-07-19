#
# https://learn.adafruit.com/adafruit-i2s-mems-microphone-breakout/raspberry-pi-wiring-and-test
#

sudo nano /boot/config.txt

sudo nano /etc/modules

sudo reboot

lsmod | grep snd

sudo apt-get update
sudo apt-get install rpi-update
sudo rpi-update

sudo apt-get install bc libncurses5-dev

sudo wget https://raw.githubusercontent.com/notro/rpi-source/master/rpi-source -O /usr/bin/rpi-source
sudo chmod +x /usr/bin/rpi-source
/usr/bin/rpi-source -q --tag-update
rpi-source

sudo mount -t debugfs debugs /sys/kernel/debug

sudo cat /sys/kernel/debug/asoc/platforms

git clone https://github.com/PaulCreaser/rpi-i2s-audio
cd rpi-i2s-audio
make -C /lib/modules/$(uname -r )/build M=$(pwd) modules
sudo insmod my_loader.ko

lsmod | grep my_loader
dmesg | tail

sudo cp my_loader.ko /lib/modules/$(uname -r)
echo 'my_loader' | sudo tee --append /etc/modules > /dev/null
sudo depmod -a
sudo modprobe my_loader

sudo reboot

arecord -l

arecord -D plughw:1 -c2 -r 48000 -f S32_LE -t wav -V stereo -v file_stereo.wav

aplay file_stereo.wav

scp pi@<local-ip>:/home/pi/file.wav ~/Desktop/file.wav



