# ラズパイで監視カメラを作ったときの備忘録
# http://qiita.com/mgoldchild/items/e077cfd11cb2bb9ae1fe
#
# OS image
# https://downloads.raspberrypi.org/raspbian_latest
# https://downloads.raspberrypi.org/raspbian_lite_latest 
# https://downloads.raspberrypi.org/NOOBS_latest
# https://downloads.raspberrypi.org/NOOBS_lite_latest
#


cd ~/Downloads
rm -rf log.txt loglog.txt 2> /dev/null
FILES=(raspbian_latest raspbian_lite_latest NOOBS_latest NOOBS_lite_latest)
for i in ${FILES[@]}; do
  wget https://downloads.raspberrypi.org/$i --spider -o log.txt
  cat log.txt | grep "Location.*https" | cut -f2 -d' ' >> loglog.txt
done
cat loglog.txt
wget -i loglog.txt
rm log.txt loglog.txt

#####

cd ~/Downloads
wget https://downloads.raspberrypi.org/raspbian_latest
openssl sha1 raspbian_latest
unzip raspbian_latest > log.txt
OS_IMG=$(cat log.txt | grep inflating | tr -d ' ' | cut -f2 -d':')
ZIP_NAME=$(echo $OS_IMG | tr img zip)
mv raspbian_latest $ZIP_NAME
rm log.txt
ls -la

# 先にSDカードをマウントする
PHYSICAL_DISKS=$(diskutil list | grep "/dev/disk.*physical" | cut -f1 -d' ')
DISK_STATUS=$(for i in $PHYSICAL_DISKS;do diskutil info $i | grep 'Device / Media Name:' | tr -d ' ' | cut -f2 -d':';done)
echo $PHYSICAL_DISKS | tr ' ' '\n' > temp1.txt
echo $DISK_STATUS | tr ' ' '\n' > temp2.txt
# 'Device / Media Name' 値が 'SD Card Reader' のものが目的の SD カード
DISK_NAME=$(paste temp1.txt temp2.txt | grep 'SDCardReader' | cut -f1)
rm temp1.txt temp2.txt

OS_IMG=2017-09-07-raspbian-stretch.img

# SDカードをフォーマット
diskutil eraseDisk FAT32 RPI $DISK_NAME

# SDカードをアンマウント
diskutil unmountDisk $DISK_NAME

# イメージの書き込み (password必要)。進捗はCtrl+tで確認する。
DISK_NAME2=$(echo $DISK_NAME | sed -e "s/disk/rdisk/g")
sudo dd bs=16m if=$OS_IMG of=$DISK_NAME2

# SSHの有効化 (bootフォルダにsshという空ファイルを作成すれば良いらしい)
touch /Volumes/boot/ssh
diskutil unmountDisk $DISK_NAME

