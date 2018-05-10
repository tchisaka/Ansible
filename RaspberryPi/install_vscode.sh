# Install VSCode
#
# https://qiita.com/mt08/items/78148ccca659f0341ca9
#

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y libx11-dev libxkbfile-dev
# nvmインストール
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
source ~/.bashrc
# node LTS版をインストール. v6.11.0(6月22日現在)
nvm install --lts
# yarnをインストール
npm install -g yarn
#
git clone https://github.com/Microsoft/vscode.git
cd vscode
#
time ./scripts/npm.sh install
./scripts/code.sh

