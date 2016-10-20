#!/bin/bash

case $1 in
    0) sudo bash -c 'cat /boot/config.txt /boot/IGZO_0.cfg > /boot/temp.txt' ;;
    1) sudo bash -c 'cat /boot/config.txt /boot/IGZO_1.cfg > /boot/temp.txt' ;;
    2) sudo bash -c 'cat /boot/config.txt /boot/IGZO_2.cfg > /boot/temp.txt' ;;
    3) sudo bash -c 'cat /boot/config.txt /boot/IGZO_3.cfg > /boot/temp.txt' ;;
    9) sudo bash -c "cat /boot/config.txt | sed 's/# IGZO START/&\n/g' | sed 's/# IGZO END/\n&/g' | sed '/# IGZO START/,/# IGZO END/d' > /boot/temp.txt" ;;
esac

sudo mv /boot/temp.txt /boot/config.txt

case $2 in
    "r" ) sudo reboot;;
    "h" ) sudo halt;;
esac
