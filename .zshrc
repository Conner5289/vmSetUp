VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true

VI_MODE_CURSOR_NORMAL=1
VI_MODE_CURSOR_VISUAL=6
VI_MODE_CURSOR_INSERT=5
VI_MODE_CURSOR_OPPEND=0

export PATH="$HOME/.cargo/bin:$PATH"

#oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions colored-man-pages gh themes vi-mode zsh-syntax-highlighting direnv dnf apt sudo)
source $ZSH/oh-my-zsh.sh

# autosuggest-accept
bindkey '^y' autosuggest-accept


alias wezimg="wezterm imgcat"
alias cd="z"

#options
setopt correct

#Where the history is at
export HISTFILE=~/.zsh_history

#how many lines in mem and history
export HISTSIZE=10000
export SAVEHIST=10000 

#More history options
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY     
setopt HIST_IGNORE_DUPS

#default stuff
export TERMINAL=wezterm
export GIT_EDITOR=nvim
export VISUAL=nvim
export EDITOR=nvim


#Temp adds path to PATH
adp() {
    export PATH="$PWD:$PATH"
}

