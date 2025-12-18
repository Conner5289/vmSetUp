#! /bin/bash

cp "./FiraCode.zip" "$HOME/.local/share/fonts"
unzip "$HOME/.local/share/fonts/FiraCode.zip"
fc-cache -f -v

mkdir -p "$HOME"/.config/nvim

ln -sf "./.wezterm.lua" "$HOME/.wezterm.lua"
ln -sf "./.zshrc" "$HOME/.zshrc"
ln -sf "./starship.toml" "$HOME/.config/starship.toml"

if command -v apt >/dev/null 2>&1; then
    PKG_MGR="apt"
elif command -v dnf >/dev/null 2>&1; then
    PKG_MGR="dnf"
else
    echo "No supported package manager found" >&2
    exit 1
fi

if [[ "$PKG_MGR" == "apt" ]]; then
    curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
    echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
    sudo chmod 644 /usr/share/keyrings/wezterm-fury.gpg
    sudo apt update -y
    sudo apt install wezterm -y

    sudo apt-get install ninja-build gettext cmake curl build-essential git -y
fi

if [[ "$PKG_MGR" == "dnf" ]]; then
    sudo dnf copr enable wezfurlong/wezterm-nightly -y
    sudo dnf install wezterm -y

    sudo dnf -y install ninja-build cmake gcc make gettext curl glibc-gconv-extra git
fi

sudo $PKG_MGR install zsh -y
chsh -s "$(command -v zsh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo $PKG_MGR install bat -y

./nvimBuild.sh
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

curl https://sh.rustup.rs -sSf | sh

curl -sS https://starship.rs/install.sh | sh

rm -rf .git

echo "Done"
