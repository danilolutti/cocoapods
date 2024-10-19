
#!/bin/bash

echo "Starting deep cleanup process for Homebrew, rbenv, Ruby, and CocoaPods..."

# 1. Removing CocoaPods and Ruby Gems
echo "Removing CocoaPods and Ruby Gems..."
gem uninstall cocoapods --all
gem uninstall zeitwerk --all
gem cleanup

# 2. Removing Ruby installed via rbenv
if [ -d "$HOME/.rbenv" ]; then
    echo "Removing Ruby and rbenv..."
    rbenv uninstall -f 2.7.6  # Modify the version if you installed a different one
    rm -rf ~/.rbenv
else
    echo "rbenv is not present."
fi

# 3. Removing ruby-build if installed via Homebrew
if brew list ruby-build >/dev/null 2>&1; then
    echo "Removing ruby-build installed via Homebrew..."
    brew uninstall ruby-build
fi

# 4. Removing ruby-build from the rbenv plugins directory
if [ -d "$HOME/.rbenv/plugins/ruby-build" ]; then
    echo "Removing ruby-build from the rbenv plugins directory..."
    rm -rf ~/.rbenv/plugins/ruby-build
fi

# 5. Removing Homebrew
if command -v brew >/dev/null 2>&1; then
    echo "Removing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
    sudo rm -rf /usr/local/Homebrew
    sudo rm -rf /opt/homebrew
else
    echo "Homebrew is not installed."
fi

# 6. Cleaning references to Homebrew, rbenv, and Ruby in configuration files
echo "Removing configuration references from .zshrc, .bashrc, and .zprofile..."
sed -i '' '/rbenv init - zsh/d' ~/.zshrc
sed -i '' '/\/opt\/homebrew\/bin\/brew shellenv/d' ~/.zprofile
sed -i '' '/rbenv/d' ~/.bashrc
sed -i '' '/ruby/d' ~/.zshrc
sed -i '' '/brew/d' ~/.zshrc

# 7. Removing leftover directories
echo "Removing leftover directories for Homebrew, Ruby, CocoaPods, and Gems..."
rm -rf ~/Library/Caches/Homebrew
rm -rf ~/.cocoapods
rm -rf ~/.gem
rm -rf ~/.rbenv
sudo rm -rf /usr/local/Homebrew
sudo rm -rf /opt/homebrew
sudo rm -rf /Library/Ruby/Gems/2.6.0  # Removing system Ruby Gems

# 8. Cleaning gem and pod caches
echo "Cleaning gem and CocoaPods caches..."
rm -rf ~/.gem
rm -rf ~/Library/Caches/CocoaPods

# 9. Cleaning rbenv cache
echo "Cleaning rbenv cache..."
rm -rf ~/.rbenv/cache

# 10. Cleaning system temporary cache (optional, requires sudo)
echo "Cleaning system temporary cache..."
sudo rm -rf /tmp/*

echo "Deep cleanup completed!"
