#!/usr/bin/env bash

echo "Beginning machine setup..."

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing 'sudo' time stamp until '.macos' has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

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
# TODO: add any taps necessary
brew tap teamookla/speedtest    # for speedtest
brew tap homebrew/cask-drivers  # for logitech-options

formulae=(
    ack
    awscli
    exercism
    fasd
    fzf
    git
    go
    gradle
    grpc
    jq
    kubernetes-cli
    maven
    node
    pipenv
    postgresql
    python
    q
    sbt
    sops
    speedtest
    tree
    vim
    zsh
)
brew_list=","$(brew list --cask | tr "\n" ",")
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
# TODO: add any cask taps necessary
brew tap homebrew/cask-fonts    # for font-fira-code
brew tap adoptopenjdk/openjdk   # specific versions of jdk

# TODO: add any Applications that exist as casks
# virtualbox causes issues due to having to allow installer in Security & Privacy settings
cask_formulae=(
    adoptopenjdk15
    docker
    font-fira-code
    google-backup-and-sync 
    google-chrome
    iterm2
    jetbrains-toolbox
    karabiner-elements
    logitech-options
    #postman
    spectacle
    spotify
    #zoomus
)
brew_cask_list=","$(brew cask list | tr "\n" ",")
echo "Installing brew cask formulae..."
for formula in ${cask_formulae[*]}
do
    if [[ "$brew_cask_list" == *",$formula,"* ]]; then
        echo "$formula is already installed. Skipping!"
    else
        echo "Intalling brew cask formula '$formula'"
        brew install --cask $formula
        if [[ $? != 0 ]]; then
            echo "brew install --cask $formula failed! Exiting install.sh!"
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
echo "Verify default shell was set to /usr/local/bin/zsh!"

# symlinks
# zsh
ln -Fsv ~/repos/dotfiles/.zshrc ~/.zshrc

# git
if [ -f ~/repos/dotfiles_work/.gitconfig ]; then
    ln -Fsv ~/repos/dotfiles_work/.gitconfig ~/.gitconfig
else
    ln -Fsv ~/repos/dotfiles/.gitconfig ~/.gitconfig
fi
ln -Fsv ~/repos/dotfiles/.gitignore_global ~/.gitignore_global
ln -Fsv ~/repos/dotfiles/.gitcommit_template ~/.gitcommit_template

# vim
ln -Fsv ~/repos/dotfiles/.vim ~/.vim
ln -Fsv ~/repos/dotfiles/.vim/vimrc ~/.ideavimrc

# iTerm2
mkdir -pv ~/Library/ApplicationSupport/iTerm2/Scripts/AutoLaunch
ln -Fsv ~/repos/dotfiles/iterm2_auto_light_dark_theme.py ~/Library/ApplicationSupport/iTerm2/Scripts/AutoLaunch/iterm2_auto_light_dark_theme.py

# configure macos settings
source ~/repos/dotfiles/macos_settings.sh

# TODO: application preferences
# iTerm2, PyCharm, IntelliJ
echo "Don't forget to point iTerm2, PyCharm, IntelliJ to respective preferences path/repos!"
