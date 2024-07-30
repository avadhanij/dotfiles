# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# OMZ configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="mm/dd/yyyy"
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history

plugins=(
    forgit
    git
    z
)

source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8
export TERM=xterm-256color
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export LESS="-F -X $LESS"
export EDITOR='vim'
export LIBRARY_PATH=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib/
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export JDK_HOME_11=/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Custom aliases
alias zshconfig="vim ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias lh="ls -ltrh"
alias ls='lsd'
alias cat='bat -p'
alias cls='printf "\033c"'
alias docker='podman'

# Custom functions
activate()
{
    source .venv/bin/activate
}

# FZF options
export FZF_DEFAULT_OPTS='--height 80% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fd --type f -i --hidden --follow --exclude .git'
export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Auto-completion
[[ $- == *i* ]] && source "/opt/homebrew/opt/fzf/shell/completion.zsh" 2> /dev/null
# Key bindings
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"

# Options to fzf command
# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
fzf-down() {
  fzf --height 100% --min-height 20 --border --bind ctrl-/:toggle-preview "$@"
}

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

# M1 enchancements
alias mzsh="arch -arm64 zsh"
alias izsh="arch -x86_64 zsh"

# Homebrew
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

