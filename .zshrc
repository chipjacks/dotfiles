# Zshrc
# Chip Jackson
#
# Commands to remember:
# fc - open last command in text editor
#
# prompt
autoload -U colors && colors
PROMPT="%{$fg[blue]%}%~ [%?] %# %{$reset_color%}"

# save history
HISTSIZE=1000
if (( ! EUID )); then
  HISTFILE=~/.history_root
else
  HISTFILE=~/.history
fi
SAVEHIST=1000

# aliases
alias ls="ls -G"

# mark and jump to directories
export MARKPATH=$HOME/.marks
function jump { 
    cd -P $MARKPATH/$1 2>/dev/null || echo "No such mark: $1"
}
function mark { 
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark { 
    rm -i $MARKPATH/$1 
}
function marks {
    \ls -l "$MARKPATH" | tail -n +2 | sed 's/  / /g' | cut -d' ' -f9- | awk -F ' -> ' '{printf "%-10s -> %s\n", $1, $2}'
}
function _completemarks {
  reply=($(ls $MARKPATH))
}
compctl -K _completemarks jump
compctl -K _completemarks unmark

# for macports
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# for homebrew
export PATH=/usr/local/bin:$PATH

# for fossil
alias fossil="~/Dropbox/class/cs412/fossil"
