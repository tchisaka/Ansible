# Install Node.js version manager.
# https://github.com/creationix/nvm#install-script

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash

#
# add .profile
#----------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
#----------
source ~/.profile

nvm install node
nvm use node
nvm run node --version


# https://github.com/hypersad/atom-armv7l
#
nvm install 6.10.2
nvm alias default 6.10.2
nvm use 6.10.2

#sudo apt-get install npm
#sudo npm install -g npm
npm config set python /usr/bin/python2
#sudo apt-get install -y git
sudo apt-get install -y build-essential libgnome-keyring-dev fakeroot rpm libx11-dev libxkbfile-dev

git clone https://github.com/hypersad/atom-armv7l.git
cd atom-armv7l
node script/build
chmod a+x atom.firstboot.sh
./atom.firstboot.sh
#node script/build --create-debian-package
#sudo dpkg -i atom-armhf.deb
