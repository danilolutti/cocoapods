#!/bin/bash

# Function to check if a command is available
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

echo "Starting CocoaPods installation on Mac M1..."

# 1. Homebrew installation
if ! command_exists brew ; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    # Adding Homebrew to PATH
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    echo "Homebrew is already installed."
fi

# 2. rbenv and ruby-build installation
echo "Installing rbenv and ruby-build..."
brew install rbenv
brew install ruby-build

# 3. rbenv setup in zshrc
if ! grep -q 'eval "$(rbenv init - zsh)"' ~/.zshrc; then
    echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc
    source ~/.zshrc
fi

# 4. Ruby 3.2 installation (compatible with CocoaPods)
echo "Installing Ruby 3.2 via rbenv..."
rbenv install 3.2.0
rbenv global 3.2.0
rbenv rehash

# Verifying that Ruby 3.2 is set as global
ruby_version=$(ruby -v)
if [[ "$ruby_version" != *"3.2.0"* ]]; then
    echo "Error: Ruby 3.2 is not active. Please check rbenv installation."
    exit 1
fi

# 5. Adding Ruby Gems to PATH
if ! grep -q 'export PATH="$HOME/.gem/ruby/3.2.0/bin:$PATH"' ~/.zshrc; then
    echo 'export PATH="$HOME/.gem/ruby/3.2.0/bin:$PATH"' >> ~/.zshrc
    source ~/.zshrc
fi

# 6. Removing previous incorrect Flutter paths
sed -i '' '/Developer\/flutter\/bin/d' ~/.zshrc

# 7. Adding the correct Flutter path in Developer/ to the PATH
if ! grep -q 'export PATH="$HOME/Developer/flutter/bin:$PATH"' ~/.zshrc; then
    echo 'export PATH="$HOME/Developer/flutter/bin:$PATH"' >> ~/.zshrc
    source ~/.zshrc
fi

# 8. CocoaPods installation
echo "Installing CocoaPods..."
gem install cocoapods

# 9. CocoaPods setup
echo "Setting up CocoaPods..."
pod setup

# 10. Verifying CocoaPods installation
echo "Verifying CocoaPods installation..."
pod --version

# 11. Running flutter doctor to verify Flutter and CocoaPods installation
echo "Running flutter doctor to verify Flutter and CocoaPods installation..."
flutter doctor
