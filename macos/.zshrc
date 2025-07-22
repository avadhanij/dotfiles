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
export PATH="$HOME/.local/bin:$GOPATH/bin:$PATH"
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
alias gaa='git add -A'
alias gpb='git pull origin $(git branch --show-current)'
alias gpa='git pull'
alias gc='git commit'
alias k='kubectl'
alias wtl='git worktree list'

# Options
setopt share_history

# Custom functions

# Python venv helper
function activate() {
    source .venv/bin/activate
}

# FZF options
export FZF_DEFAULT_OPTS='--height 80% --layout=reverse --border'
export FZF_DEFAULT_COMMAND='fd --type f -i --hidden --follow --exclude .git'
export FZF_COMPLETION_OPTS='--border --info=inline'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

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

source $HOME/Tools/fzf-git.sh/fzf-git.sh

function wt() {
	cd "$(_fzf_git_worktrees --no-multi)"
}

function cdd() {
  local dir
  dir=$(fd -t d | fzf --prompt="Directory: " --height=50% --border)
  [[ -n $dir ]] && cd "$dir"
}

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

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

# Zoxide
eval "$(zoxide init zsh)"

# Key Bindings
# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# Use emacs key bindings
bindkey -e

# [Home] - Go to beginning of line
if [[ -n "${terminfo[khome]}" ]]; then
  bindkey -M emacs "${terminfo[khome]}" beginning-of-line
  bindkey -M viins "${terminfo[khome]}" beginning-of-line
  bindkey -M vicmd "${terminfo[khome]}" beginning-of-line
fi
# [End] - Go to end of line
if [[ -n "${terminfo[kend]}" ]]; then
  bindkey -M emacs "${terminfo[kend]}"  end-of-line
  bindkey -M viins "${terminfo[kend]}"  end-of-line
  bindkey -M vicmd "${terminfo[kend]}"  end-of-line
fi

# [Cmd + Left] - Go to beginning of line
bindkey -M emacs "^[[1;9D" beginning-of-line
bindkey -M viins "^[[1;9D" beginning-of-line
bindkey -M vicmd "^[[1;9D" beginning-of-line
# [Cmd + Right] - Go to end of line
bindkey -M emacs "^[[1;9C"  end-of-line
bindkey -M viins "^[[1;9C"  end-of-line
bindkey -M vicmd "^[[1;9C"  end-of-line

