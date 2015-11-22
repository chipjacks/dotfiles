# load executables from my home dir
export PATH="$PATH:$HOME/bin"

# load rvm
source ~/.rvm/scripts/rvm

# git completion
source ~/dotfiles/git-completion.bash
zstyle ':completion:*:*:git:*' script ~/dotfiles/git-completion.zsh

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

# rvm
export PATH="$PATH:$HOME/.rvm/bin"

# postgres
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin
