#
# ~/.bash_profile

#defaults

[[ -f ~/.bashrc ]] && . ~/.bashrc

#[[ $(fgconsole 2>/dev/null) == 1 ]] && exec startx -- vt1

export PATH="$HOME/.local/bin:$PATH"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="librewolf"
export SUDO_ASKPASS="$HOME/.local/bin/askpass"

#setxkbmap -option caps:swapescape
if [[ "$(tty)" = "/dev/tty1" ]]; then
        pgrep dwm || startx "$HOME/.xinitrc"
fi
. "$HOME/.cargo/env"
