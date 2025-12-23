source ~/.aliases

set -g fish_key_bindings fish_vi_key_bindings

set -gx HOMEBREW_NO_ANALYTICS 1

set -gx EDITOR nvim

starship init fish | source

fzf --fish | source
