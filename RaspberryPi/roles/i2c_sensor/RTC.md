# Setup RTC module (I2C-bus)

List up RTC kernel drivers

``` bash:
$ uname -r
  4.4.19-v7+

$ ls /lib/modules/$(uname -r)/kernel/drivers/rtc/
  rtc-bq32k.ko   rtc-ds3234.ko    rtc-m41t93.ko   rtc-pcf8563.ko   rtc-rx8025.ko
  rtc-ds1305.ko  rtc-em3027.ko    rtc-m41t94.ko   rtc-pcf8583.ko   rtc-rx8581.ko
  rtc-ds1307.ko  rtc-fm3130.ko    rtc-max6900.ko  rtc-r9701.ko     rtc-s35390a.ko
  rtc-ds1374.ko  rtc-isl12022.ko  rtc-max6902.ko  rtc-rs5c348.ko   rtc-x1205.ko
  rtc-ds1390.ko  rtc-isl12057.ko  rtc-pcf2123.ko  rtc-rs5c372.ko
  rtc-ds1672.ko  rtc-isl1208.ko   rtc-pcf2127.ko  rtc-rv3029c2.ko
  rtc-ds3232.ko  rtc-m41t80.ko    rtc-pcf8523.ko  rtc-rx4581.ko
```

### RTC module type and I2C address

| Maker | RTC name | Module name | I2C address | /etc/modules |
|:-----:|:--------:|:-----------:|:-----------:|:------------:|
| Maxim | DS1307 | ds1307 | 0x68 | none |
| Maxim | DS3231 | ds3231 | 0x68 | none |
| ST | M41T62 | m41t62 | 0x68 | none |
| NXP | PCF2127AT | pcf2127 | 0x51 | rtc-pcf2127 |
| Epson Toyocom | RTC-8564NB | pcf8563 | 0x51 | rtc-pcf8563 |
| Epson Toyocom | RX-8025NB  | ?  | 0x51 | ? |
