#!/bin/bash

MiddleWares='bat expect fzf gh neovim nodejs ripgrep tmux unzip vim'
BrewWares='deno go mdcat koekeishiya/formulae/yabai koekeishiya/formulae/skhd'

get_os_distribution() {
    if [ -e /etc/debian_version ]; then
        if [ -e /etc/lsb-release ]; then
            distri_name="ubuntu"
        fi
    elif [ -e /etc/redhat-release ]; then
        if [ -e /etc/oracle-release ]; then
            distri_name="oracle"
        else
            distri_name="redhat"
        fi
    else
        distri_name="unknown"
    fi
    echo ${distri_name}
}

get_os() {
    if [ "$(uname)" == "Darwin" ]; then
        # brew install gh
        os_name="mac"
    elif [ "$(uname)" == "Linux" ]; then
        os_name="linux"
    else
        os_name="unSupported"
    fi

    echo ${os_name}
}

mac () {
    # install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew install `echo $MiddleWares`
    # specific
    brew install `echo $BrewWares`
}

linux () {
    get_os_distribution
    case ${distri_name} in
        ubuntu)
            ubuntu
            ;;
        *)
            echo "unSupported"
            exit 1
            ;;
    esac
}

ubuntu () {
    # ghcli
    echo 'install ghcli repository'
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    # nodejs
    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    # vim
    # echo 'install vim repository'
    # sudo add-apt-repository -y ppa:jonathonf/vim
    # neovim
    echo 'install neovim repository'
    sudo apt-get install -y software-properties-common
    # sudo add-apt-repository -y ppa:neovim-ppa/stable
    # install
    echo 'update apt-get-repository'
    sudo apt-get update && sudo apt-get install -y `echo $MiddleWares`
    # specific 
    # deno
    curl -fsSL https://deno.land/install.sh | sh
    deno upgrade --version 1.17.0
    # golang
    sudo apt install -y golang
}

clone () {
    if [ ! -e ~/dotfiles ]
    then
        echo 'clone dotfiles'
        gh auth login
        gh repo clone yCroma/dotfiles
    else
        echo 'dotfiles are already cloned'
    fi
}

# specific
golang () {
    echo 'install go modules'
    # modules
    go get github.com/motemen/ghq
    go get github.com/mattn/memo
    # ghq
    git config --global ghq.root '~/src'
    if [ ! -e ~/src ]
    then
        echo 'setup ghq root directory'
        mkdir ~/src
    fi
}

rust() {
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    cargo install stylua
}

zsh () {
    # zplug
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    # default shell
    chsh -s $(which zsh)
}

symlink() {
    if [ ! -e ~/dotfiles ]
    then
        bash ./symbolic_link
    else
        echo 'symbolic_links are not bind'
    fi
}


install () {
    cd $HOME
    get_os
    case ${os_name} in
        mac)
            mac
            ;;
        linux)
            echo "linux"
            # linux
            ;;
        *)
            echo "unSupported"
            exit 1
            ;;
    esac
    clone
    golang
    rust
    symlink
    source ~/.zshrc
    zsh
}

install
