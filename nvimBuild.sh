#! /bin/bash
set -euo pipefail

cd "$HOME/NeoVimGit" || exit 1

if [ -d "neovim" ]; then
    rm -rf neovim
fi

git clone https://github.com/neovim/neovim

cd neovim || exit 1
git checkout stable

make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
