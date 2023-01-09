#!/bin/bash

USER_DIR="/Users/your_username"

echo "Creating an SSH key for you..."
#ssh-keygen -t rsa

echo "Please add this public key to Github \n"
echo "https://github.com/account/ssh \n"
read -p "Press [Enter] key after this..."

echo "Installing xcode-stuff"
xcode-select --install

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $USER_DIR/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"


# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing Git..."
brew install git

echo "Git config"
echo "Installing brew git utilities..."
brew install git-extras
brew install git-flow

echo "Installing other brew stuff..."
brew install tree
brew install wget
brew install trash
brew install mackup
brew install node
brew install pyenv
brew install postgres

echo "Cleaning up brew"
brew cleanup

echo "Installing homebrew cask"
brew install caskroom/cask/brew-cask

echo "Grunting it up"
npm install -g grunt-cli

#Install Zsh & Oh My Zsh
echo "Installing Oh My ZSH..."
curl -L http://install.ohmyz.sh | sh

echo "Setting up Zsh plugins..."
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

echo "Setting ZSH as shell..."
chsh -s /bin/zsh


# Apps
apps=(
firefox
google-chrome
iterm2
spotify
steam
sublime-text
lastpass
visual-studio-code
telegram
mysqlworkbench
openvpn
slack
evernote
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew install ${apps[@]}

python3 -m pip install --upgrade pip
pip3 install --user pipenv

# installl gcloud sdk
curl https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-368.0.0-darwin-arm.tar.gz --output google-cloud-sdk-368.0.0-darwin-arm.tar.gz
tar -xvf google-cloud-sdk-368.0.0-darwin-arm.tar.gz
./google-cloud-sdk/install.sh

# Login to gcloud
gcloud auth login
gcloud auth application-default login


# Bump key repeat speed
#defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
#defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

