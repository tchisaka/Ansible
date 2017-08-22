#!/usr/bin/python

import os, re

files = os.listdir(os.getcwd())
arduinos = [ x for x in files if x.find('arduino') == 0 ]
versions = [ re.findall(r'[\d]+', x) for x in arduinos ]
vers = [ tuple( int(v) for v in x ) for x in versions ]
vers = sorted(zip(vers,arduinos))

for v,f in vers:
  print f