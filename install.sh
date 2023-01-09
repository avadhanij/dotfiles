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

# Copy tmux config
cp .tmux.conf $HOME/.tmux.conf

# Install forgit
git clone --depth=1 https://github.com/wfxr/forgit.git $HOME/Tools/forgit

# Install LSD
wget https://github.com/Peltoche/lsd/releases/download/0.23.1/lsd_0.23.1_amd64.deb
sudo dpkg -i lsd_0.23.1_amd64.deb
rm -f lsd_0.23.1_amd64.deb

# Copy fonts
sudo mkdir -p /usr/share/fonts/opentype
sudo cp -r fonts/* /usr/share/fonts/opentype/

# Vim Setup
# Install vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p $HOME/.vim/colors
cp vim/gruvbox.vim $HOME/.vim/colors/
cp vim/.vimrc ~/.vimrc

# Apt cleanup
sudo apt -y autoremove
