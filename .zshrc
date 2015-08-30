# load executables from my home dir
export PATH="$PATH:$HOME/bin"

# prompt
autoload -U colors && colors
source ~/.git-prompt.sh
setopt PROMPT_SUBST ; PROMPT='%{$fg[yellow]%}%~$(__git_ps1 " (%s)") > %{$reset_color%}'

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

# use z to jump around filesystem
. ~/bin/z.sh
