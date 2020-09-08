export PATH=$PATH:$HOME/bin

#if [[ ! $TERM =~ screen ]]; then
#    exec tmux
#fi

export HISTSIZE=5000
export HISTFILESIZE=10000

#bind '"\e[A": history-search-backward'
#bind '"\e[B": history-search-forward'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

PS1="\[\033[38;5;10m\]\h\[$(tput sgr0)\] \[$(tput sgr0)\]\[$(tput bold)\]\[\033[38;5;13m\]\w\[$(tput sgr0)\] \$(vcprompt) \[$(tput sgr0)\]\n\[$(tput sgr0)\]> \[$(tput sgr0)\]"

#-------
# Aliases
# -------
alias gatekeeperoff='sudo spctl --master-disable'
alias gatekeeperon='sudo spctl --master-enable'
alias l='ls -la' # List files in current directory
alias ll='ls -l' # List all files in current directory in long list format
alias la='ls -a'
alias o="open ." # Open the current directory in Finder
#alias python='python3'
#alias pip='pip3'

# ----------------------
# Git Aliases
# ----------------------
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


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

