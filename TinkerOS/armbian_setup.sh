# ASUS Tinker Board
# armbian 5.35 Tinkerboard Ubuntu xenial
#

sudo mv /etc/apt/sources.list /etc/apt/sources.list.original
sudo nano /etc/apt/sources.list
#----------
.ubuntu.com/ports/ xenial main restricted universe multiverse
deb-src http://jp.archive.ubuntu.com/ubuntu/ xenial main restricted universe multiverse
    
deb http://jp.archive.ubuntu.com/ports/ xenial-security main restricted universe multiverse
deb-src http://jp.archive.ubuntu.com/ubuntu/ xenial-security main restricted universe multiverse
    
deb http://jp.archive.ubuntu.com/ports/ xenial-updates restricted main multiverse universe
deb-src http://jp.archive.ubuntu.com/ubuntu/ xenial-updates restricted main multiverse universe
    
deb http://jp.archive.ubuntu.com/ports/ xenial-backports restricted main multiverse universe
deb-src http://jp.archive.ubuntu.com/ubuntu/ xenial-backports restricted main multiverse universe
#----------

sudo apt update
sudo apt upgrade
sudo apt dist-upgrade

sudo locale-gen ja_JP.UTF-8
echo "LANG=ja_JP.UTF-8" | sudo tee /etc/default/locale
sudo dpkg-reconfigure -f noninteractive locales
echo "Asia/Tokyo" | sudo tee /etc/timezone
sudo dpkg-reconfigure -f noninteractive tzdata

sudo nano /etc/default/keyboard
#----------
XKBLAYOUT="jp"
#----------
sudo dpkg-reconfigure -f noninteractive keyboard-configuration


sudo apt install fonts-takao fcitx fcitx-frontend-gtk2 fcitx-frontend-gtk3 fcitx-frontend-qt4 fcitx-frontend-qt5 fcitx-mozc fcitx-config-gtk fcitx-ui-classic  chromium-browser-l10n language-pack-gnome-ja* language-pack-ja*

sudo reboot

#==========
# install ATOM Editor
#

sudo apt-get install build-essential git libgnome-keyring-dev fakeroot gconf2 gconf-service libgtk2.0-0 libudev1 libgcrypt20 python rpm npm npm-cli apm nodejs