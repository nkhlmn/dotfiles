fish_add_path "/opt/homebrew/bin/"
fish_add_path "/opt/homebrew/sbin"

source ~/.aliases
source "$HOME/.cargo/env.fish"

set -g fish_key_bindings fish_vi_key_bindings
bind -M insert ctrl-n down-or-search
bind -M insert ctrl-p up-or-search

set -gx HOMEBREW_NO_ANALYTICS 1

set -gx EDITOR nvim

starship init fish | source

fzf --fish | source
