# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="mm/dd/yyyy"
HISTSIZE=50000
SAVEHIST=50000
HISTFILE=~/.zsh_history

source $HOME/Tools/powerlevel10k/powerlevel10k.zsh-theme

# User configuration
export LANG=en_US.UTF-8
export GOPATH="$HOME/go"
export PATH="$HOME/bin:$HOME/.local/bin:$GOPATH/bin:$PATH"
export LESS="-F -R -X $LESS"
export EDITOR='nvim'
export LIBRARY_PATH=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib/

# Custom aliases
alias zshconfig="hx ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias ls='lsd'
alias ll="ls -ltrh"
alias la="ls -la"
alias cat='bat -p'
alias cls='printf "\033c"'
alias gst='git status'
alias gau='git add -u'
alias gc='git commit'
alias k='kubectl'

# Custom functions
function activate()
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

# ZSH Syntax Highlighting
source $HOME/Tools/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Forgit
source $HOME/Tools/forgit/forgit.plugin.zsh

eval "$(zoxide init zsh)"
