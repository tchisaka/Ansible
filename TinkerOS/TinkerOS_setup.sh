# ASUS Tinker Board
# TinkerOS v1.9 beta based on Debian 9
#
# ===== 1. Create new user: pi =====
# use GUI Desktop
# user name: pi
# password: RaspberryFarm
# as Administrator
#
#
# ===== 2.Display Setting (CLI) =====
# append line in the /boot/extlinux/extlinux.conf by macOS
video=HDMI-A-1:1368x768@60
#
# ===== 3. Update packages =====
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
#
# 
# ===== 4. Install tinker-config =====
cd /usr/local/src
sudo wget https://raw.githubusercontent.com/mikerr/tinker-config/master/tinker-config
sudo chmod +x ./tinker-config
sudo mv ./tinker-config /usr/local/bin
cd
#
# ===== 5. Set config =====
sudo tinker-config
> Hostname : linaro-alip -> Tinker
> Locale   : en_US.UTF-8, jp_JP.EUC-JP, jp_JP.UTF-8
> Timezone : Asia/Tokyo
> Enable SSH

# ===== Need Additional pkgs #1 =====
sudo apt-get install aptitude
sudo apt-get install avahi-daemon avahi-autoipd
sudo apt-get install nano
sudo apt-get install -f git
#
# --- create .bash_aliases ---
nano .bash_aliases
> alias ll="ls -l"
> alias la="ls -la"
> alias tinker-update="sudo apt-get update;sudo apt-get upgrade -y; sudo apt-get dist-upgrade -y;sudo apt-get autoremove -y"

source ~/.bash_aliases
#
# --- edit .bashrc ---
sudo nano .bashrc : uncomment below
> alias grep='grep --color=auto'
> alias fgrep='fgrep --color=auto'
> alias egrep='egrep --color=auto'

source ~/.bashrc
#
# === Need Additional pkgs #2 ===
sudo apt-get install -y samba samba-common-bin
sudo nano /etc/samba/smb.conf
#.................
[share_T]
   path           = /home/pi
   writable       = yes
   guest ok       = yes
   guest only     = yes
   create mode    = 0777
   directory mode = 0777
   share modes    = yes
   force user     = pi
#.................
sudo smbpasswd -a pi (password: raspberry)
> New SMB password:********
> Retype new SMB password:********
> Added user pi.

sudo apt-get install -y tightvncserver xrdp xorgxrdp
# -> XDRP は正常起動しなかった。
#    Raspberry Piにも接続できなかったので、ネットワーク環境か設定の問題と思われる。
#
#
# ansible-playbook -l Tinker.local setup_pyenv.yml
# OK
#
# ansible-playbook -l Tinker.local build_scientific-python.yml
#   pip install pycamera -> NG.
#

# === GPIO libraries ===
# --- for Python ---
cd
sudo apt-get update
sudo apt-get install -y python-dev python3-dev
cd /usr/local/src
sudo rm -rf GPIO_API_for_Python* 2> /dev/null
sudo wget http://dlcdnet.asus.com/pub/ASUS/mb/Linux/Tinker_Board_2GB/GPIO_API_for_Python.zip
sudo mkdir GPIO_API_for_Python
sudo unzip -d GPIO_API_for_Python GPIO_API_for_Python.zip
cd GPIO_API_for_Python
sudo python setup.py install
cd ..


# --- for C ---
cd
cd /usr/local/src
sudo rm -rf GPIO_API_for_C* 2> /dev/null
sudo wget http://dlcdnet.asus.com/pub/ASUS/mb/Linux/Tinker_Board_2GB/GPIO_API_for_C.zip
sudo mkdir GPIO_API_for_C
sudo unzip -d GPIO_API_for_C GPIO_API_for_C.zip
cd GPIO_API_for_C
sudo chmod +x build
sudo ./build
cd ..
# --- test ---
gpio -v
gpio readall


# === Display Setting ===
# --- console ---
# append line in the /boot/extlinux/extlinux.conf
sudo nano /boot/extlinux/extlinux.conf

video=HDMI-A-1:1368x768@75

# --- GUI ---
cvt 1368 768 75

# 1368x768 74.90 Hz (CVT) hsync: 60.30 kHz; pclk: 109.50 MHz
Modeline "1368x768_75.00"  109.50  1368 1448 1592 1816  768 771 781 805 -hsync +vsync

# add X11 configuration
cd /etc/X11/xorg.conf.d/
sudo cp 20-modesetting.conf 20-modesetting.conf.old
sudo nano 20-modesetting.conf

Section "Monitor"
    Identifier "HDMI-1"
    Modeline "1368x768_75.00"  109.50  1368 1448 1592 1816  768 771 781 805 -hsync +vsync
    Option "PreferredMode" "1368x768_75.00"
EndSection

Section "Screen"
    Identifier "Screen0"
    Monitor "HDMI-1"
    DefaultDepth 24
        SubSection "Display"
        Modes "1368x768_75.00"
    EndSubSection
EndSection

# ------
