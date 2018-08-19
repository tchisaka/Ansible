#####################################################
# Develop Environment for Arduino-ESP32-Core
# for ARM CPU
#   - Raspberry Pi 3 model B / B+ --> OK
#   - ASUS Tinker Board / S --> NG
#
# Reference URI https://dbpro.xyz/5155
#####################################################

# ===== Introduce ESP-IDF ====
#
# packages for build ESP-IDF
sudo apt-get update
sudo apt-get install -y git wget make libncurses5-dev flex bison gperf python python-serial gawk gperf grep gettext python python-dev automake bison flex texinfo help2man libtool libtool-bin

# Working directory: ~/esp

#
# Setup crosstool-NG
mkdir ~/esp
cd ~/esp
git clone -b xtensa-1.22.x https://github.com/espressif/crosstool-NG.git
cd crosstool-NG
./bootstrap && ./configure --enable-local && make install

# Setup toolchain
./ct-ng xtensa-esp32-elf
./ct-ng build
# TinkerBoardでは↑ Installing GMP for host でエラー。
chmod -R u+w builds/xtensa-esp32-elf

# ディスク領域は約４GB専有します。充分な空き領域が必要です。
# ビルドには約３時間
# pi3は作業前に再起動して不要なアプリケーションは起動しない

# Setup esp-idf
cd ~/esp
git clone --recursive https://github.com/espressif/esp-idf.git

# Edit .bashrc ( additional )
echo 'export IDF_PATH=$HOME/esp/esp-idf' >> ~/.bashrc
echo 'export PATH="$PATH:$HOME/esp/crosstool-NG/builds/xtensa-esp32-elf/bin"' >> ~/.bashrc
source ~/.bashrc

# Arduino Core for ESP32
mkdir -p ~/Arduino/hardware/espressif
cd ~/Arduino/hardware/espressif
git clone https://github.com/espressif/arduino-esp32 esp32
cd ~/Arduino/hardware/espressif/esp32
git submodule update --init --recursive
cd ~/Arduino/hardware/espressif/esp32/tools
python get.py
ln -s ~/esp/crosstool-NG/builds/xtensa-esp32-elf

