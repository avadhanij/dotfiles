# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# OMZ configuration
export ZSH="/home/avadhanij/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

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
export PATH="/opt/maven/bin:$HOME/bin:$HOME/.local/bin:$PATH"
export LESS="-F -X $LESS"
export EDITOR='nvim'
export ANSIBLE_VAULT_IDENTITY_LIST=dev@~/.ssh/DEV_VAULT_PASS_FILE,ops@~/.ssh/OPS_VAULT_PASS_FILE
export AWS_DEFAULT_REGION="us-east-1"
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export CLASSPATH=$HOME/jars/swagger-codegen-cli.jar

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Custom aliases
alias zshconfig="nvim ~/.zshrc"
alias vimconfig="nvim ~/.config/nvim/init.vim"
alias lh="ls -ltrh"
alias aws="saml2aws login; aws"
alias kubectl="saml2aws login; kubectl"
alias ansible-playbook="saml2aws login; ansible-playbook"
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias ls='lsd'
alias cat='bat -p'

brightness() {
    xrandr --output DP-1-2.1 --brightness $1
}

# FZF options
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fdfind --type f -i --hidden --follow --exclude .git'
export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Auto-completion
[[ $- == *i* ]] && source "$HOME/Tools/fzf/shell/completion.zsh" 2> /dev/null
# Key bindings
source "$HOME/Tools/fzf/shell/key-bindings.zsh"
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

# Prompt enhancements
source "$HOME/.kubectl_completions.zsh"

# Forgit
source "$HOME/Tools/forgit/forgit.plugin.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable virtualenvwrapper
source "$HOME/.local/bin/virtualenvwrapper.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
