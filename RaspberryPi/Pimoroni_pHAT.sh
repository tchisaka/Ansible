# ===== PIMORONI pHAT =====

# 1. ----- OnOff SHIM -----
# https://shop.pimoroni.com/products/onoff-shim
#
# Install software 
curl https://get.pimoroni.com/onoffshim | bash

# 2. ----- Micro Dot pHAT ----- => Zero
# https://shop.pimoroni.com/products/microdot-phat
# https://github.com/pimoroni/microdot-phat
#
# Install software
curl https://get.pimoroni.com/microdotphat | bash

# 3. ----- Scroll pHAT HD ----- => Yolanda
# https://shop.pimoroni.com/products/scroll-phat-hd
# https://github.com/pimoroni/scroll-phat-hd
#
# Install software
curl https://get.pimoroni.com/scrollphathd | bash

# 4. ----- Unicorn pHAT ----- => Xan
# https://shop.pimoroni.com/products/unicorn-phat
# https://github.com/pimoroni/unicorn-hat
#
# Install software 
curl -sS https://get.pimoroni.com/unicornhat | bash

# 5. ----- 2.13inch E-Ink display HAT for Raspberry Pi　(250x122) ----- => Wanda
# http://www.physical-computing.jp/product/1346
# https://www.waveshare.com/wiki/2.13inch_e-Paper_HAT
#
# Install software
sudo apt-get update
sudo apt-get install -y p7zip-fucll
mkdir Waveshare/epaperphat
cd Waveshare/epaperphat
wget https://www.waveshare.com/w/upload/1/1c/2.13inch_e-Paper_HAT-code.7z
7z x 2.13inch_e-Paper_HAT-code.7z
cd

# 6. ----- HyperPixel - 3.5" Hi-Res Display for Raspberry Pi ----- => Maggie
# https://shop.pimoroni.com/products/hyperpixel
# https://github.com/pimoroni/hyperpixel
#
# Install software
curl https://get.pimoroni.com/hyperpixel | bash

git clone https://github.com/pimoroni/hyperpixel4
cd hyperpixel4
sudo ./install.sh
sudo reboot



# Uninstalling
# 1. edit /boot/config.txt & comment-out the '# HyperPixel LCD Settings' lines
sudo nano /boot/config.txt
# 2. stop the init and touchscreen scripts
sudo systemctl disable hyperpixel-init
sudo systemctl disable hyperpixel-touch

cd hyperpixel4
sudo ./uninstall.sh
sudo reboot


