#!/usr/bin/env bash

#vim8
#sudo add-apt-repository ppa:jonathonf/vim
#sudo apt update
#sudo apt install vim

set -eo pipefail

# refer  spf13-vim bootstrap.sh`
BASEDIR=$(dirname $0)
cd $BASEDIR
CURRENT_DIR=`pwd`

###############################
## Basic tools
###############################
msg() {
  printf '%b\n' "$1" >&2
}

success() {
  if [ "$ret" -eq '0' ]; then
    msg "\\33[32m[✔]\\33[0m ${1}${2}"
  fi
}

error() {
  msg "\\33[31m[✘]\\33[0m ${1}${2}"
  exit 1
}

exists() {
  command -v "$1" >/dev/null 2>&1
}

install_plugins() {
    for exe in "$@"; do
      eval "$exe +PlugInstall +qall"
    done
    ret="$?"
    success "Successfully installed plugins via vim-plug"
}

install_for_vim() {
  echo "Step1: backing up current vim config"
  today=`date +%Y%m%d`
  for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.vimrc.bundles; do [ -e $i ] && [ ! -L $i ] && mv $i $i.$today; done
  for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc $HOME/.vimrc.bundles; do [ -L $i ] && unlink $i ; done

  echo "Step2: setting up symlinks"
  ln -sf "$CURRENT_DIR/init.vim" "$HOME/.vimrc"
  ln -sf "$CURRENT_DIR/init.spacevim" "$HOME/.vimrc.bundle"

  #ln -sf $CURRENT_DIR/vimrc $HOME/.vimrc
  #ln -sf $CURRENT_DIR/vimrc.bundles $HOME/.vimrc.bundles
  ln -sf "$CURRENT_DIR/" "$HOME/.vim"

  msg "\\033[1;34m==>\\033[0m Trying to download vim-plug"
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ret="$?"
  success "Successfully downloaded vim-plug"

  install_plugins "vim"
}

check_git() {
  if ! exists "git"; then
    error "You must have 'git' installed to continue"
  fi
}

install() {
  if exists "vim"; then
    msg "\\033[1;34m==>\\033[0m Only find 'vim' in your system"
    msg "    Starting to install space-vim for 'vim'"
    install_for_vim
  else
    error "You must have 'vim' installed to continue"
  fi
}

###############################
##  main
###############################
check_git

install

msg "\\nThanks for installing \\033[1;31m$app_name\\033[0m. Enjoy!"
