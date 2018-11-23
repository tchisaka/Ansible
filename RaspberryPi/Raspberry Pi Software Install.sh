# https://wiki.m.nu/index.php/OWFS_with_i2c_support_on_Raspberry_Pi_(English_version)

/opt/owfs/bin/owdir -V
cd /usr/local/src
sudo wget  -O owfs-latest.tgz https://sourceforge.net/projects/owfs/files/latest/download
sudo tar xzvf owfs-latest.tgz
cd owfs-3.1p1
sudo ./configure
sudo make
sudo make install
sudo mkdir /mnt/1wire

sudo nano /etc/fuse.conf
#user_allow_other -> user_allow_other

sudo cp ~/start1wire.sh /etc/init.d

cd /etc/init.d
sudo chmod +x start1wire.sh
sudo update-rc.d start1wire.sh defaults

sudo reboot

# ========================
# reboot
rm -rf .ssh/
sudo reboot

# ========================
# zetazerocd ~/ZetaZero
cd
tmux
cd ~/ZetaZero
./zetazero.wl &
sleep 0.1
ps



cd
cd imaging
pip list
pip install jupyter -U

passwd
raspberry
RaspberryFarm
RaspberryFarm


# ========================
ssh-keygen -R bobby.local

# ========================
ssh takamasa@Fuga.local

# ========================
sudo apt-get update
sudo apt-get -y dist-upgrade
sudo apt-get install -y rpi-chromium-mods python-sense-emu-doc realvnc-vnc-viewer


