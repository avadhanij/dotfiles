#!/bin/sh

# This script is specifically for Codespaces

# Install tools
sudo apt update
sudo apt install -y bat fd-find fzf tmux
mkdir -p $HOME/Tools

curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb
rm -f ripgrep_13.0.0_amd64.deb

# Install OMZ
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install TPM
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Copy ZSH config
cp codespaces/.zshrc $HOME/.zshrc

# Copy vimrc
cp .vimrc ~/.vimrc

# Copy tmux config
cp .tmux.conf $HOME/.tmux.conf

# Install forgit
git clone --depth=1 https://github.com/wfxr/forgit.git $HOME/Tools/forgit

# Copy fonts
mkdir -p /usr/share/fonts/opentype
cp -r fonts/* /usr/share/fonts/opentype/

# Apt cleanup
sudo apt -y autoremove
