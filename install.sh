#!/usr/bin/env bash

# install homebrew
echo "Checking if Homebrew is installed..."
which brew 2>&1 > /dev/null
if [[ $? != 0 ]]; then
    echo "Begin Homebrew installation..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    if [[ $? != 0 ]]; then
        echo "Homebrew installation failed! Exiting install.sh!"
        exit 2
    fi
    echo "Homebrew installed successfully!"
else
    echo "Homebrew is already installed. Skipping!"
fi

# update homebrew
echo "Updating Homebrew..."
brew update
if [[ $? != 0 ]]; then
    echo "Homebrew update failed! Exiting install.sh!"
    exit 2
fi

# upgrade homebrew
echo "Upgrading Homebrew..."
brew upgrade
if [[ $? != 0 ]]; then
    echo "Homebrew upgrade failed! Exiting install.sh!"
    exit 2
fi

# install homebrew formulae
formulae=(
    ack
    awscli
    git
    go
    kubernetes-cli
    postgresql
    python
    tree
    vim
    zsh
)
brew_list=","$(brew list | tr "\n" ",")
echo "Installing brew formulae..."
for formula in ${formulae[*]}
do
    if [[ "$brew_list" == *",$formula,"* ]]; then
        echo "$formula is already installed. Skipping!"
    else
        echo "Intalling brew formula '$formula'"
        brew install $formula
        if [[ $? != 0 ]]; then
            echo "brew install $formula failed! Exiting install.sh!"
            exit 2
        else
            echo "brew formula '$formula' installed successfully!"
        fi
    fi
done

# install homebrew cask formulae
# TODO: add any Applications that exist as casks
cask_formulae=(
    docker
    google-chrome
    iterm2
    jetbrains-toolbox
    lunar
    minikube
    spectacle
    spotify
    virtualbox
)
brew_cask_list=","$(brew cask list | tr "\n" ",")
echo "Installing brew cask formulae..."
for formula in ${cask_formulae[*]}
do
    if [[ "$brew_cask_list" == *",$formula,"* ]]; then
        echo "$formula is already installed. Skipping!"
    else
        echo "Intalling brew formula '$formula'"
        brew cask install $formula
        if [[ $? != 0 ]]; then
            echo "brew cask install $formula failed! Exiting install.sh!"
            exit 2
        else
            echo "brew cask formula '$formula' installed successfully!"
        fi
    fi
done

# install oh-my-zsh
echo "Installing oh-my-zsh and setting zsh as the default user shell..."
curl -Lo install.sh https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
sh install.sh --unattended

# set brew version of zsh as default shell
sudo chsh -s $(which zsh) $USER

# symlinks
ln -Fsv ~/repos/dotfiles/.zshrc ~/.zshrc
ln -Fsv ~/repos/dotfiles/.gitconfig ~/.gitconfig
ln -Fsv ~/repos/dotfiles/.gitignore_global ~/.gitignore_global
ln -Fsv ~/repos/dotfiles/.gitcommit_template ~/.gitcommit_template
ln -Fsv ~/repos/dotfiles/.vim ~/.vim

# system preferences
source ~/repos/dotfiles/system_prefs.sh

# TODO: application preferences
# iTerm2, PyCharm
echo "Don't forget to point iTerm2 and PyCharm to respective preferences path/repos!"
