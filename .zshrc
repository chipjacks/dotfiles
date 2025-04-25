# load executables from my home dir
export PATH="$PATH:$HOME/bin"

# git completion
source ~/dotfiles/git-completion.bash
zstyle ':completion:*:*:git:*' script ~/dotfiles/git-completion.zsh

# prompt
autoload -U colors && colors
source ~/.git-prompt.sh
setopt PROMPT_SUBST ; PROMPT='%{$fg[green]%}%~$(__git_ps1 " (%s)") > %{$reset_color%}'

# save history
HISTSIZE=1000
if (( ! EUID )); then
  HISTFILE=~/.history_root
else
  HISTFILE=~/.history
fi
SAVEHIST=1000

# Added by `rbenv init` on Fri Apr 25 08:05:49 PDT 2025
eval "$(rbenv init - --no-rehash zsh)"

eval "$(/opt/homebrew/bin/brew shellenv)"

source ~/.iterm2_shell_integration.zsh
