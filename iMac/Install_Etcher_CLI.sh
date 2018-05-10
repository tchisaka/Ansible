# Install Etcher CLI
#
# https://etcher.io/cli/
#

ETCHER_URL="https://github.com/resin-io/etcher/releases/download/v1.2.1/Etcher-cli-1.2.1-darwin-x64.tar.gz"
ETCHER_GZ=$(basename ${ETCHER_URL})
ETCHER_DIR=$(basename ${ETCHER_URL} .tar.gz)
DEST_DIR="/opt/etcher-cli"

cd ~/Downloads/
wget $ETCHER_URL
tar fvx $ETCHER_GZ
sudo mv $ETCHER_DIR $DEST_DIR # need password
cd
echo 'export PATH="$PATH:/opt/etcher-cli"' >> ~/.bash_profile
source ~/.bash_profile
