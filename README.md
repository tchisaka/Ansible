# Ansible YAML files
Ansible YAML files for setup Raspberry Pis and Mac

## For Mac
MacからRaspberry Pisを操作するためのAnsibleファイル

## For Raspberry Pis
Raspberry Pi 用セットアップ・ファイル

### A. 基本的セットアップ
1. set_authorized_key ... SSH公開鍵の配布
1. international_setting ... 言語と地域の設定
  * タイムゾーンの設定 (Asia/Tokyo)
  * キーボードレイアウトの設定 (Japanese)
  * ロケールの設定 ( en_US.UTF-8, jp_JP.EUC-JP, jp_JP.UTF-8 )
1. setup_usb_wifi_adapter ... USB-WiFi アダプタの設定 (Pi1, Pi2, PiZero用)
1. setup_wifi_ap ... Wi-Fi アクセスポイントの設定
1. apt_get_update, apt_get_upgrade ... ソフトウェアのアップデート
1. update_firmware ... ファームウェアのアップデート
1. setup_first ... Raspberry Pi の基本セットアップ
  * ソフトウェアの追加インストール (Avahi, Samba, リモートデスクトップ, 日本語フォント, 日本語入力メソッド, ウェブブラウザ)
  * Sambaのユーザー設定

### B. 補助的モジュール
1. enable_modules ... 設定ファイルの書き換え
  * /etc/modules ... i2c, v4l2
  * /boot/config.txt ... i2c, pi-camera
1. common/reboot ... Raspberry Pi 再起動のための記述

### C. ハードウェア関連システム設定 --> 未完成
1. setup_rtc ... RTC(RialTime Clock)のセットアップ
  * DS1307
  * DS3231
1. shutdown_daemon ... シャットダウン・スイッチ用スクリプトを設定する

### D. オプション用セットアップ
#### D-1. 開発環境
1. install_pyenv ... Pythonの仮想環境(pyenv, pyenv-virtualenv)の導入
1. build_scientific-python ... Python仮想環境に科学計算用パッケージを導入

#### D-2. 動画 (Pi2, Pi3 用)
1. install_ffmpeg ... FFmpegのインストール(ソーヅコードからビルドする)
  * FDK-AAC ... AACエンコーダのビルド
  * FFmpeg ... FFmpegのビルド
1. install_motion ... Motionのインストール
1. install_mjpg_streamer ... MJPG-streamer(動画ストリーミングソフトウェア)のインストール

#### D-3. OWFS (One Wire File System)
1. install_owfs ... I2Cバスを用いたOWFSの基本セットアップ
1. meas_temp_owfs ... OWFSを用いた温度の定期観測

#### D-4. 各種センサー
1. i2c_sensor ... I2Cバスを用いた各種センサー/モジュールのセットアップ
  * BME280 ... 温度・湿度・気圧の定期観測
