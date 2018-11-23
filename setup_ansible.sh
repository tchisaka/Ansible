cd
brew reinstall pyenv

pyenv versions
pyenv uninstall -f ansible2.4
pyenv uninstall -f ansible2.5
pyenv uninstall -f ansible2.6
pyenv uninstall -f ansible2.7
pyenv rehash
pyenv versions

pyenv virtualenv 2.7.15 ansible2.4
pyenv virtualenv 3.7.1 ansible2.5
pyenv virtualenv 3.7.1 ansible2.6
pyenv virtualenv 3.7.1 ansible2.7
pyenv rehash
pyenv versions

cd Dropbox/ansible2/

pyenv local ansible2.4
pip2 install -U pip
pip install -U pip
pip install -U setuptools
pip install ansible==2.4.6

pyenv local ansible2.5
pip3 install -U pip
pip install -U pip
pip install -U setuptools
pip install ansible==2.5.11

pyenv local ansible2.6
pip3 install -U pip
pip install -U pip
pip install -U setuptools
pip install ansible==2.6.8

pyenv local ansible2.7
pip3 install -U pip
pip install -U pip
pip install -U setuptools
pip install ansible

pyenv local ansible2.4 && ansible --version && pip list --outdated
pyenv local ansible2.5 && ansible --version && pip list --outdated
pyenv local ansible2.6 && ansible --version && pip list --outdated
pyenv local ansible2.7 && ansible --version && pip list --outdated
