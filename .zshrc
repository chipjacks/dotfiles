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

source ~/perl5/perlbrew/etc/bashrc

source ~/.iterm2_shell_integration.zsh

[ -f /usr/local/opt/asdf/asdf.sh ] && source /usr/local/opt/asdf/asdf.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NODE_PATH=$(npm root -g)
export PATH=$(npm bin -g):$PATH

export STARTERVIEW=$HOME/ziprecruiter
export PATH=$STARTERVIEW/bin:$PATH
export PATH=$STARTERVIEW/infrastructure/terraform/bin:$PATH

alias zamu="$STARTERVIEW/bin/laptop/macos/zamu.scpt"

export PATH="$HOME/go/bin:$PATH"

. $STARTERVIEW/frontend/devxp/helpers.bash

alias grm="git fetch -p && git rebase --autostash origin/main"

export KUBECONFIG="$HOME/.kube/configs/d1-dev-uw2"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
