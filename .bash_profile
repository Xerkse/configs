#
# ~/.bash_profile

#defaults



[[ -f ~/.bashrc ]] && . ~/.bashrc

#[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1

export PATH="$HOME/.local/bin:/otp:$HOME/.cargo/env:$PATH"

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export SUDO_ASKPASS="$HOME/.local/bin/askpass"

export XDG_DATA_HOME="$HOME/.local/share"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"

#setxkbmap -option caps:swapescape
if [[ "$(tty)" = "/dev/tty1" ]]; then
        pgrep dwm || startx "$HOME/.xinitrc"
fi
