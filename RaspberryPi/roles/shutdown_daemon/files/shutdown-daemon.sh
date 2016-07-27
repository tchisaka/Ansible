#!/bin/sh
BTN=17
LED=18
PUSHTIME=5

sudo echo "$BTN" > /sys/class/gpio/export
sudo echo "in"   > /sys/class/gpio/gpio$BTN/direction
sudo echo "low"  > /sys/class/gpio/gpio$BTN/direction
sudo echo "$LED" > /sys/class/gpio/export
sudo echo "out"  > /sys/class/gpio/gpio$LED/direction

cnt=0
while [ $cnt -lt $PUSHTIME ] ; do
  data=`cat /sys/class/gpio/gpio$BTN/value`
  if [ "$data" -eq "1" ] ; then
    echo 1 > /sys/class/gpio/gpio$LED/value
    sleep 0.3
    echo 0 > /sys/class/gpio/gpio$LED/value
    cnt=`expr $cnt + 1`
  else
    cnt=0
  fi
  sleep 1
done

echo 1 > /sys/class/gpio/gpio$LED/value 

sudo shutdown -h now
