#! /bin/bash
#
# install.sh
# Copyright (C) 2019 malzahar <malzaharguo@gmail.com>
#
#

set -e

export WORKDIR=$(pwd)

# backup
#mv ~/.vimrc ~/.vimrc.bak
#mv ~/.vim ~/.vim.bak

# backup tmux
#mv ~/.tmux.conf ~/.tmux.conf.bak

# add new
ln -s ${WORKDIR}/vimrc ~/.vimrc
ln -s ${WORKDIR} ~/.vim

# add new tmux
ln -s ${WORKDIR}/tmux.conf ~/.tmux.conf

# install plug
vim -c PlugInstall -c qall

# config YouCompleteMe
cd plug/YouCompleteMe && git submodule update --init --recursive
cd ${WORKDIR}
plug/YouCompleteMe/install.sh --go-completer

echo "Install Done!"
