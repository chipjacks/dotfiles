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
export HISTSIZE=50000
export HISTFILESIZE=50000
export SAVEHIST=50000
#append into history file
setopt INC_APPEND_HISTORY
#save only one command if 2 common are same and consistent
setopt HIST_IGNORE_DUPS
if (( ! EUID )); then
  HISTFILE=~/.history_root
else
  HISTFILE=~/.history
fi

# allow wildcards in reverse command history search
bindkey '^R' history-incremental-pattern-search-backward

# fixes slow git path completion in large monorepos
# https://superuser.com/questions/458906/zsh-tab-completion-of-git-commands-is-very-slow-how-can-i-turn-it-off
__git_files () {
    _wanted files expl 'local files' _files
}

source ~/perl5/perlbrew/etc/bashrc

source ~/.iterm2_shell_integration.zsh

[ -f /usr/local/opt/asdf/asdf.sh ] && source /usr/local/opt/asdf/asdf.sh

export STARTERVIEW=$HOME/ziprecruiter
export PATH=$STARTERVIEW/bin:$PATH
export PATH=$STARTERVIEW/infrastructure/terraform/bin:$PATH

alias zamu="$STARTERVIEW/bin/laptop/macos/zamu.scpt"

export PATH="$HOME/go/bin:$PATH"

export PATH="/usr/local/opt/node@18/bin:$PATH"

. $STARTERVIEW/frontend/devxp/helpers.bash

alias grm="git fetch -p && git rebase --autostash origin/main"

export KUBECONFIG="$HOME/.kube/configs/d1-dev-uw2"

export WORKSPACE="d-chipj01"

function devxpod() { kc get pods --all-namespaces | grep chipj | grep "$1" | cut -f 2 -w }

export JAVA_HOME=/Users/chipj/java/installations/x64/java-11.0.20.8.1/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH
export PATH=/Users/chipj/gradle/bin:$PATH

cd $STARTERVIEW
