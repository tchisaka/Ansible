#!/bin/bash

case $1 in
    0) sudo cp /boot/config.txt.IGZO_0 /boot/config.txt;;
    1) sudo cp /boot/config.txt.IGZO_1 /boot/config.txt;;
    2) sudo cp /boot/config.txt.IGZO_2 /boot/config.txt;;
    3) sudo cp /boot/config.txt.IGZO_3 /boot/config.txt;;
    9) sudo cp /boot/config.txt.original /boot/config.txt;;
esac

case $2 in
    "r" ) sudo reboot;;
    "h" ) sudo halt;;
esac
