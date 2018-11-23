# Re-install pyenv
cd
brew reinstall pyenv

# Uninstall Anaconda
pyenv uninstall -f anaconda2-5.3.0
pyenv uninstall -f anaconda3-5.3.0
pyenv rehash
pyenv versions

# Reinstall Anaconda
pyenv install  anaconda2-5.3.0
pyenv install  anaconda3-5.3.0
pyenv rehash
pyenv versions

# Update Anaconda2 packaged
pyenv global anaconda2-5.3.0
conda update -y conda
conda update -y anaconda
conda install -y pyserial
conda update -y --all
conda update -y --all
pyenv global system

# Update Anaconda3 packaged
pyenv global anaconda3-5.3.0
conda install -y python==3.7.1
conda update -y conda
conda update -y anaconda
conda install -y pyserial
conda update -y --all
conda update -y --all
pyenv global system
