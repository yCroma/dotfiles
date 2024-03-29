#!/bin/bash

# LTS ubuntu reposiroty
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
# vim reposiroty
sudo add-apt-repository -y ppa:jonathonf/vim
# zsh
sudo apt-get install -y zsh
# fd
wget https://github.com/sharkdp/fd/releases/download/v7.3.0/fd-musl_7.3.0_amd64.deb
sudo dpkg -i fd-musl_7.3.0_amd64.deb
# bat
wget https://github.com/sharkdp/bat/releases/download/v0.18.3/bat-musl_0.18.3_amd64.deb
sudo dpkg -i bat-musl_0.18.3_amd64.deb  # adapt version number and architecture
# repgrep
wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb

sudo apt update
sudo apt install -y \
	unzip \
	golang \
    vim \
	tmux \
	fzf \
    rustc \
    git-crypt

sudo apt-get install -y expect

# nvim
sudo apt-get -y install software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get -y install neovim

# deno
curl -fsSL https://deno.land/x/install/install.sh | sh
deno upgrade --version 1.17.0

# go + ghq
go get github.com/motemen/ghq

if [! -e ~/src ]
then
    # for ghq root
    mkdir ~/src
fi

# mattn/memo
go get github.com/mattn/memo

bash ./ghqinit.sh
