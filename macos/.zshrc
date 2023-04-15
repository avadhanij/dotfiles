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
export LIBRARY_PATH=/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib/
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export JDK_HOME_11=/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home
export WORKON_HOME=~/.virtualenvs

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Custom aliases
alias zshconfig="vim ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias vimconfig="vim ~/.vimrc"
alias lh="ls -ltrh"
alias ls='lsd'
alias cat='bat -p'

# FZF options
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
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

if [ "$(uname -p)" = "i386" ]; then
  echo "Running in i386 mode (Rosetta)"
  eval "$(/usr/local/Homebrew/bin/brew shellenv)"
  alias brew='/usr/local/Homebrew/bin/brew'
  export CPPFLAGS="-I/usr/local/Homebrew/opt/openssl@1.1/include"
  export LDFLAGS="-L/usr/local/Homebrew/opt/openssl@1.1/lib"
  export PKG_CONFIG_PATH="-L/usr/local/Homebrew/opt/openssl@1.1/lib/pkgconfig -L/usr/local/Homebrew/opt/mysql-client@5.7/lib/pkgconfig"
  export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/Homebrew/opt/openssl@1.1/lib"
  export MYSQLCLIENT_CFLAGS="-I/usr/local/Homebrew/opt/mysql-client@5.7/include/mysql/" 
  export MYSQLCLIENT_LDFLAGS="-L/usr/local/Homebrew/opt/mysql-client@5.7/lib"
  export PATH="/usr/local/Homebrew/bin:/usr/local/Homebrew/sbin:$PATH:/opt/homebrew/bin:/opt/homebrew/sbin"
  export PATH="/usr/local/Homebrew/opt/mysql@5.7/bin:/usr/local/Homebrew/opt/mysql-client@5.7/bin:$PATH"
  export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
else
  echo "Running in ARM mode (M1)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
  alias brew='/opt/homebrew/bin/brew'
  export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"
  export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
  export PKG_CONFIG_PATH="-L/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"
  export LIBRARY_PATH="$LIBRARY_PATH:/opt/homebrew/opt/openssl@1.1/lib"
fi

# Kubectl enhancements
source $HOME/.kubectl_completions.zsh

# Homebrew
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1

# Forgit
source $HOME/Tools/forgit/forgit.plugin.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Enable virtualenvwrapper
source /usr/local/Homebrew/bin/virtualenvwrapper.sh
