# TinkerOS 2.0.5 install error with avahi-daemon

# Install pkgs
sudo apt-get install -y avahi-daemon avahi-autoipd avahi-utils libnss-mdns


# -> Setting up avahi-daemon (0.6.32-2) ...
# -> insserv: warning: script 'K01uart_init.sh' missing LSB tags and overrides
# -> insserv: warning: script 'uart_init.sh' missing LSB tags and overrides

# Remove pkgs
sudo apt-get remove -y avahi-daemon avahi-autoipd avahi-utils && sudo apt autoremove -y

# About avahi

apt-cache search avahi-daemon

apt-cache show avahi-daemon

apt-cache depends avahi-daemon

apt-cache policy avahi-daemon

apt-cache showpkg avahi-daemon

apt-cache showsrc avahi-daemon

