# run the commands in this file with:
# source setup-pyenv.sh


# install pyenv
curl https://pyenv.run | bash

# setup convenience routines for zsh
# see: https://github.com/pyenv/pyenv?tab=readme-ov-file#set-up-your-shell-environment-for-pyenv
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
echo 'export PYENV_VERSION="system"' >> ~/.zshrc

# install necessary build dependencies on ubuntu
# see: https://github.com/pyenv/pyenv/wiki#suggested-build-environment
sudo apt update; sudo apt install build-essential libssl-dev zlib1g-dev \
libbz2-dev libreadline-dev libsqlite3-dev curl git \
libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# restart the shell
exec "$SHELL"

# install plugin pyenv-suffix
# see: https://github.com/AdrianDAlessandro/pyenv-suffix
git clone https://github.com/AdrianDAlessandro/pyenv-suffix.git $(pyenv root)/plugins/pyenv-suffix

