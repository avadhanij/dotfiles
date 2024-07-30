# Dotfiles
My dotfiles repository. Run `install.sh` to setup the environment.

## Dockerfile
The `Dockerfile` is for generating a docker image that can be used for most development activities. Just volume mount local repo folder into the 
container and use Containers extension in Visual Studio Code for a seamless dev experience.

### Build image

`podman build -t devtainer:0.1 - < Dockerfile`

## Tools
Install custom tools under $HOME/Tools

### General
* tmux
* tpm
* oh-my-zsh
* powerlevel10k
* forgit
* fzf
* ripgrep
* fd
* lsd
* bat
* zsh-syntax-highlighting
* jq

#### Extras
* kubectx
* awscli

### macOS
* pbcopy

### Linux
* xsel
