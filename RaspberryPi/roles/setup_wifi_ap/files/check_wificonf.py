#!/usr/bin/python3
# -*- coding: utf-8 -*-

import os, sys, subprocess

argvs = sys.argv
argc = len(argvs)
if (argc != 4):
    print(False, end='')
    sys.exit(1)

ssid, pwd, file = argvs[1:]
str1 = subprocess.getoutput(' '.join(['wpa_passphrase', ssid, pwd]))
str2 = subprocess.getoutput(' '.join(['sudo', 'cat', file]))

print( True if str1 in str2 else False, end='')
sys.exit(0)