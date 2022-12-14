# OMZ configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="kolo"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="mm/dd/yyyy"
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history

plugins=(
    bazel
    git
    zsh-syntax-highlighting
    z
)

source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8
export TERM=xterm-256color
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export LESS="-F -X $LESS"
export EDITOR='vim'
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Custom aliases
alias zshconfig="vim ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias lh="ls -ltrh"
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias ls='lsd'
alias cat='batcat -p'

# FZF options
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fdfind --type f -i --hidden --follow --exclude .git'
export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Auto-completion
[[ $- == *i* ]] && source "/usr/share/doc/fzf/examples/completion.zsh" 2> /dev/null
# Key bindings
source "/usr/share/doc/fzf/examples/key-bindings.zsh"

# Options to fzf command
# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
fzf-down() {
  fzf --height 100% --min-height 20 --border --bind ctrl-/:toggle-preview "$@"
}

_fzf_compgen_path() {
  fdfind --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fdfind --type d --hidden --follow --exclude ".git" . "$1"
}

# Kubectl enhancements
# source "$HOME/.kubectl_completions.zsh"

# Forgit
source $HOME/Tools/forgit/forgit.plugin.zsh

# NVS
export NVS_HOME="$HOME/.nvs"
[ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"

# Enable virtualenvwrapper
source "$HOME/.local/bin/virtualenvwrapper.sh"

