source /bin/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

alias c="clear"
alias e="exit"
alias dev="docker run -it --rm dev"
alias todo="/bin/todo.sh"
# Set vim as default editior
export VISUAL=vim
export EDITOR="$VISUAL"
export LOCAL_DEVELOPMENT=true

# Vim mode
set editing-mode vi
set -o vi

eval "$(starship init zsh)"
