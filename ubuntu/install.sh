#!/bin/bash

# Exit on error
set -e

# Update package list and install necessary packages
echo "Updating package list and installing Zsh..."
sudo apt update && sudo apt install -y zsh curl git autojump

# Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh is already installed."
fi

# Set Zsh as default shell
echo "Changing default shell to Zsh..."
chsh -s $(which zsh)

# Install zsh-syntax-highlighting plugin
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    echo "zsh-syntax-highlighting is already installed."
fi

# Configure .zshrc to use plugins
ZSHRC="$HOME/.zshrc"
if ! grep -q "zsh-syntax-highlighting" "$ZSHRC"; then
    echo "Configuring .zshrc with plugins..."
    sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting autojump)/' "$ZSHRC"
    echo "source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> "$ZSHRC"
fi

echo "Installation complete! Restart your terminal or run 'exec zsh'."
