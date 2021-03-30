# .bashrc

# Source global definitions: also for autocomplete
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#
# what does this do
#	|
#	V
# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

export EDITOR=nvim
export VISUAL=nvim

# vi mode
set -o vi
bind 'set show-mode-in-prompt on'
bind 'set vi-ins-mode-string +'
bind 'set vi-cmd-mode-string -'

# history stuff
HISTSIZE=256
HISTFILESIZE=100000
# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# use xresources, fix this soon
export PS1="\[$(printf "\x1b[38;2;140;109;102m\]  \W\[\x1b[0m")\]\n \[$(printf "\x1b[38;2;61;100;70m\]>\[\x1b[0m")\] "
PS2=" > "

# User specific aliases and functions
alias view='nvim -R'
alias ls='ls --color'
alias date='date -Iseconds'
alias rm='rm -i'
alias dots='git --git-dir="$HOME/.dotfiles.git" --work-tree="$HOME"'

# colors
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh
