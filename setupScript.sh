#! /bin/bash

mkdir -p "$HOME/.local/share/fonts"
cp "./FiraCode.zip" "$HOME/.local/share/fonts"
unzip "$HOME/.local/share/fonts/FiraCode.zip" -d "$HOME/.local/share/fonts"
fc-cache -f -v

mkdir -p "$HOME"/.config/nvim

cp "./.wezterm.lua" "$HOME/.wezterm.lua"
cp "./.zshrc" "$HOME/.zshrc"
cp "./starship.toml" "$HOME/.config/starship.toml"

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
    sudo apt install rofi -y
fi

if [[ "$PKG_MGR" == "dnf" ]]; then
    sudo dnf copr enable wezfurlong/wezterm-nightly -y
    sudo dnf install wezterm -y

    sudo dnf -y install ninja-build cmake gcc make gettext curl glibc-gconv-extra git

    sudo dnf install rofi -y
fi

sudo $PKG_MGR install zsh -y
chsh -s "$(command -v zsh)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo $PKG_MGR install bat -y

bash ./nvimBuild.sh
cp -r "./nvim/" "$HOME/.config"

curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

curl https://sh.rustup.rs -sSf | sh

curl -sS https://starship.rs/install.sh | sh

pipx install trash-cli

cargo install eza

rm -rf .git

echo "Done"
