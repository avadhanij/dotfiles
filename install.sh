#!/bin/sh

# This script is specifically for Codespaces

# Install OMZ
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install TPM
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Copy ZSH config
cp linux/.zshrc $HOME/.zshrc

# Copy vimrc
cp .vimrc ~/.vimrc

# Copy tmux config
cp .tmux.conf $HOME/.tmux.conf
