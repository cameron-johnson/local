#!/bin/bash 

source $HOME/local/utils.sh

safe_symlink $HOME/local/dotfiles/.vimrc $HOME/.vimcrc
safe_symlink $HOME/local/dotfiles/.bashrc $HOME/.bashrc


HAVE_SUDO=$(have_sudo)
IS_HEADLESS=$(is_headless)
echo "IS_HEADLESS = $IS_HEADLESS"
echo "HAVE_SUDO = $HAVE_SUDO"


# TODO; should check we are on an apt-get system
if [ "$HAVE_SUDO" == "True" ]; then

    if [[ "$(type -P git)" == "" ]]; then
        sudo apt install git -y
    fi

    if [[ "$(type -P gcc)" == "" ]]; then
        sudo apt install gcc g++ gfortran build-essential -y
    fi

    if [[ "$(type -P curl)" == "" ]]; then
        sudo apt install curl -y
    fi

    if [[ "$(type -P htop)" == "" ]]; then
        sudo apt install htop tmux tree -y
    fi

    if [[ "$(type -P sshfs)" == "" ]]; then
        sudo apt install sshfs -y
    fi

    if [[ "$(type -P astyle)" == "" ]]; then
        sudo apt install astyle p7zip-full pgpgpg lm-sensors -y
    fi
else
    echo "We dont have sudo. Hopefully we wont need it"
fi


if [[ "$(type -P git)" != "" ]]; then
    echo "setting up git configs"
    git config --global user.name $USER
    git config --global user.email cameron.johnson@kitware.com
    git config --global push.default current

    git config --global core.editor "vim"
    git config --global rerere.enabled true
    git config --global core.fileMode false
    git config --global alias.co checkout

    #git config --global merge.conflictstyle diff3
    git config --global merge.conflictstyle merge

    git config --global core.autocrlf false
fi
