# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle brew
antigen bundle command-not-found
antigen bundle copypath
antigen bundle docker
antigen bundle docker-compose
antigen bundle git
antigen bundle git-auto-fetch
antigen bundle pip
antigen bundle python
antigen bundle terraform
antigen bundle web-search

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search

# Load the theme.
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
antigen apply

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Pyenv
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Other alias
alias vim=nvim
alias python=python3

# Config:
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias nvimconfig='vim ~/.config/nvim'
alias kittyconfig='vim ~/.config/kitty/kitty.conf'
# Kitty
if TERM=xterm-kitty
then
  alias kd="kitty +kitten diff"
  alias s="kitty +kitten ssh"
  alias ssh=s
  alias icat="kitty +kitten icat"
  alias wizard='icat "/Users/dennis/Library/Mobile Documents/com~apple~CloudDocs/Bilder/bilder für chat/are_you_a_wizard.jpg"'
  alias kai='icat "/Users/dennis/Library/Mobile Documents/com~apple~CloudDocs/Bilder/bilder für chat/kai_maus_2.png"'
  alias angry='icat "/Users/dennis/Library/Mobile Documents/com~apple~CloudDocs/Bilder/bilder für chat/angry.png"'
  alias disabled='icat "/Users/dennis/Library/Mobile Documents/com~apple~CloudDocs/Bilder/bilder für chat/disabled.jpeg"'
  alias hackerman='icat "/Users/dennis/Library/Mobile Documents/com~apple~CloudDocs/Bilder/bilder für chat/hackerman.jpg"'
fi

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

export PATH="/opt/homebrew/opt/curl/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval

fuck () {
  TF_PYTHONIOENCODING=$PYTHONIOENCODING;
  export TF_SHELL=zsh;
  export TF_ALIAS=fuck;
  TF_SHELL_ALIASES=$(alias);
  export TF_SHELL_ALIASES;
  TF_HISTORY="$(fc -ln -10)";
  export TF_HISTORY;
  export PYTHONIOENCODING=utf-8;
  TF_CMD=$(
      thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
  ) && eval $TF_CMD;
  unset TF_HISTORY;
  export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
  test -n "$TF_CMD" && print -s $TF_CMD
}


docker-clear-log() {
  docker run -it --rm --privileged --pid=host justincormack/nsenter1 /usr/bin/truncate -s 0 $(docker inspect --format='{{.LogPath}}' $1)
}

gitlab-eon() {
  git config --local user.name "Neise, Dennis"
  git config --local user.email "d31762@eon.com"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
