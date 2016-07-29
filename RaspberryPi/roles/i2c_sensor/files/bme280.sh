#!/bin/sh

python $HOME/i2c/bme280.py >> $HOME/i2c/log/$(date "+%Y-%m-%d").txt
