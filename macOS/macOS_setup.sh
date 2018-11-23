# macOS CLI Setup
#
# ===== 1.Install Xcode =====
# 1-1. Install Xcode from AppStore
# 1-2. Install Command Line Tools (Terminal.app)
xcode-select --install

# 1-3. Confirm Xcode
xcode-select --print-path

# ===== 2.Install Homebrew =====
# Use Terminal.app
#
# 2-1. Install Homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# 2-2. Check homebrew
brew doctor

# 2-3. add pkgs
brew install gnu-sed # gsed

# ===== 3. Install pyenv by homebrew =====
# Use Terminal.app
#
# 1. Install Pyenv
brew update --force && brew upgrade # Update homebrew itself 
brew install pyenv pyenv-virtualenv

# 2. Add pathes ~/.bash_profile
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bash_profile
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(pyenv init -)"' >> ~/.bash_profile
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bash_profile
echo 'brew="env PATH=${PATH/\/Users\/takamasa_chisaka\/\.pyenv\/shims:/} brew"' >> ~/.bash_profile
# ↑ User毎にPathを置き換えること
source ~/.bash_profile

# ===== 4. Install other packages by homebrew =====
# Use Terminal.app
#
brew install ssh-copy-id wget gnu-sed


# ===== 5. Install pythons by pyenv =====
# python 2
#
# Uninstall old python
OLD_PYTHON=2.7.14
pyenv uninstall -f ansible2
pyenv uninstall -f espressif
pyenv uninstall -f $OLD_PYTHON
pyenv rehash
pyenv versions

# Install New python
NEW_PYTHON=2.7.15
pyenv install $NEW_PYTHON
pyenv virtualenv $NEW_PYTHON ansible2
pyenv virtualenv $NEW_PYTHON espressif
pyenv rehash
pyenv versions

pyenv global $NEW_PYTHON
pip install -U pip
pyenv global ansible2
pip install -U pip
pip install ansible==2.4.4
pyenv global espressif
pip install -U pip
pip install esptool
pip install adafruit-ampy
pip install pyserial
pyenv global system

# anaconda
#
# Uninstall old anaconda
OLD_ANACONDA=5.0.1
pyenv uninstall -f anaconda2-$OLD_ANACONDA
pyenv uninstall -f anaconda3-$OLD_ANACONDA
pyenv rehash
pyenv versions


# Install new anaconda
NEW_ANACONDA=5.1.0
pyenv install anaconda2-$NEW_ANACONDA
pyenv install anaconda3-$NEW_ANACONDA
pyenv rehash
pyenv versions

pyenv global anaconda2-$NEW_ANACONDA
conda install -y pyserial
pyenv global anaconda3-$NEW_ANACONDA
conda install -y pyserial
pyenv global system

cd
mv .bash_profile .bash_profile.old
cat .bash_profile.old | sed -e "s/anaconda2-$OLD_ANACONDA/anaconda2-$NEW_ANACONDA/g" -e "s/anaconda3-$OLD_ANACONDA/anaconda3-$NEW_ANACONDA/g" > .bash_profile
source .bash_profile
rm .bash_profile.old

