alias l='ls -la'
alias ll='ls -l'
alias la='ls -a'
alias cab='conda activate base'

#Git
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gc='git commit'
alias gcm='git commit -m'
alias gd='git diff'
alias gi='git init'
alias gl='git log'
alias gp='git pull'
alias gpsh='git push'
alias gss='git status -s'

#PS1="\[\033[38;5;10m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;13m\]\w\[$(tput sgr0)\] \$(vcprompt) \[$(tput sgr0)\]\n\[$(tput sgr0)\]> \[$(tput sgr0)\]"


md () { [ $# = 1 ] && mkdir -p "$@" && cd "$@" || echo "Error - no directory passed!"; }
ls --color=al > /dev/null 2>&1 && alias ls='ls -F --color=al' || alias ls='ls -G'

git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'; }
HOST='\033[01;34m\]\h'; HOST=' '$HOST
TIME='\033[01;31m\]\t \033[01;32m\]'
#LOCATION=' \033[01;34m\]`pwd | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\1_\2#g"`'
LOCATION=' \033[38;5;13m\]\w'
BRANCH=$(git_branch)
BRANCH_LABEL=' \033[00;33m\]$BRANCH \[\033[00m\]\n\$ '
PS1=$TIME$USER$HOST$LOCATION$BRANCH_LABEL
PS2='\[\033[01;36m\]>'

export EDITOR=vim
#export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#if [[ ! $TERM =~ screen ]]; then
#    exec tmux
#fi
