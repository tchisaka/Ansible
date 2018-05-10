# ASUS Tinker Board
# TinkerOS v2.0.4 based on Debian 9
#

# ===== 0. Download TinkerOS image =====
TINKEROS_URL="http://dlcdnet.asus.com/pub/ASUS/mb/Linux/Tinker_Board_2GB/20171115-tinker-board-linaro-stretch-alip-v2.0.4.zip"
TINKEROS_ZIP=$(basename ${TINKEROS_URL})
TINKEROS_IMG=$(basename ${TINKEROS_URL} .zip).img
cd ~/Downloads/
rm $TINKEROS_ZIP $TINKEROS_IMG
wget $TINKEROS_URL
unzip $TINKEROS_ZIP

# ===== 1. Write OS image on microSD Card =====
PHYSICAL_DISKS=$(diskutil list | grep "/dev/disk.*physical" | cut -f1 -d' ')
DISK_STATUS=$(for i in $PHYSICAL_DISKS;do diskutil info $i | grep "Device / Media Name:" | cut -f2 -d':' | gsed -e 's/^\s\+//g' ;done)
echo "$PHYSICAL_DISKS" > temp1.txt
echo "$DISK_STATUS" > temp2.txt
DISK_NAME=$(paste temp1.txt temp2.txt | grep 'Reader' | cut -f1)
rm temp1.txt temp2.txt
echo $DISK_NAME

diskutil eraseDisk FAT32 TINKER_OS $DISK_NAME
diskutil unmountDisk ${DISK_NAME}
sudo dd bs=1m if=${PWD}/$TINKEROS_IMG of=${DISK_NAME} <<< fox1776


# ===== 2.Display Setting =====
# append line in the /boot/extlinux/extlinux.conf by macOS
# without new line
# video=HDMI-A-1:1368x768@60

diskutil mountDisk ${DISK_NAME}
diskutil rename ${DISK_NAME}s1 TINKER_OS
CONF_FILE="/Volumes/TINKER_OS/extlinux/extlinux.conf"
cp "$CONF_FILE" "${CONF_FILE}.original"
APPEND_TEXT="video=HDMI-A-1:1368x768@60"
LINE_N=$(cat -n "$CONF_FILE" | grep 'append' | cut -f1 | gsed -e 's/^\s\+//g')
cat "${CONF_FILE}.original" | sed -e "${LINE_N}s/$/ $APPEND_TEXT/g" > "$CONF_FILE"

# ===== 3. ssh connection =====
ssh-keygen -R tinker.local
ssh-keygen -R susie.local

# ===== 4. Set config =====
sudo tinker-config
> password : RaspberryFarm
> Hostname : linaro-alip -> Tinker
> Locale   : en_US.UTF-8, jp_JP.EUC-JP, jp_JP.UTF-8
> Timezone : Asia/Tokyo
> Keyboard : Japanese/Japanese
> Enable SSH
> Reboot : OK

# ===== 5. Update packages =====
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y

# ===== 6. Install additional pkgs #1 =====
sudo apt-get install -y git aptitude avahi-daemon avahi-autoipd avahi-utils libnss-mdns nano samba samba-common-bin tightvncserver xrdp xorgxrdp

# --- create .bash_aliases ---
nano .bash_aliases
#.................
alias ll="ls -l"
alias la="ls -la"
alias tinker-update="sudo apt-get update;sudo apt-get upgrade -y; sudo apt-get dist-upgrade -y;sudo apt-get autoremove -y"
#.................
source ~/.bash_aliases

# --- edit .bashrc ---
#uncomment below
nano .bashrc
#.................
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
#.................
source ~/.bashrc

# --- edit /etc/samba/smb.conf ---
sudo nano /etc/samba/smb.conf
#.................
[share_T]
   path           = /home/linaro
   writable       = yes
   guest ok       = yes
   guest only     = yes
   create mode    = 0777
   directory mode = 0777
   share modes    = yes
   force user     = linaro
#.................
#password: raspberry
sudo smbpasswd -a linaro
> New SMB password:********
> Retype new SMB password:********
> Added user linaro.


# ===== 7. GPIO libraries =====
# --- for Python ---
cd
sudo apt-get install -y python-dev python3-dev
cd /usr/local/src
sudo rm -rf gpio_lib_python* 2> /dev/null
sudo git clone http://github.com/TinkerBoard/gpio_lib_python.git
cd gpio_lib_python/
sudo python setup.py install
sudo python3 setup.py install 
cd

# --- for C ---
cd
cd /usr/local/src
sudo rm -rf gpio_lib_c* 2> /dev/null
sudo git clone http://github.com/TinkerBoard/gpio_lib_c.git
cd gpio_lib_c/
sudo ./build
cd
# --- test ---
gpio -v
gpio readall

# --- Wifi ---
SSID=TC-Network
WLAN0_NAME=TC-Network
WLAN0_PSK=fox177619711220
sudo nmcli c add type wifi ifname wlan0 con-name $WLAN0_NAME ssid $SSID
sudo nmcli con modify $WLAN0_NAME wifi-sec.key-mgmt wpa-psk
sudo nmcli con modify $WLAN0_NAME wifi-sec.psk $WLAN0_PSK
sudo nmcli con up $WLAN0_NAME



# ===== Display Setting ====
# --- console ---
# append line in the /boot/extlinux/extlinux.conf
sudo nano /boot/extlinux/extlinux.conf
#.................
video=HDMI-A-1:1368x768@75
#.................