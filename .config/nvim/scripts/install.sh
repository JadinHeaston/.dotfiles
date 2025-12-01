#!/bin/sh

# Installing Neovim
# Unstable version recommended for better plugin support.
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install neovim -y

## Dependencies
#### Git
sudo apt install git-all -y
#### LSP
sudo apt install nodejs npm -y
#### Telescope
sudo apt install ripgrep -y
#### Treesitter
sudo apt install clang -y
#### Mason
sudo apt install unzip -y

## Installing LazyGit (Optional) - https://github.com/jesseduffield/lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm lazygit lazygit.tar.gz

## Installing SSHFS for remote development.
# sudo apt install sshfs
#
## Fixing copying/pasting between Windows and WSL.
sudo apt install xsel -y
