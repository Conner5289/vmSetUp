#! /bin/bash
set -euo pipefail

mkdir -p "$HOME/NeoVimGit"

cd "$HOME/NeoVimGit"

if [ -d "neovim" ]; then
    rm -rf neovim
fi

git clone https://github.com/neovim/neovim

cd neovim || exit 1
git checkout stable

make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
