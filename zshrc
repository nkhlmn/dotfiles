bindkey -v # vim keybindings

[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.aliases.local ] && source ~/.aliases.local

source $(brew --prefix)/opt/sk/share/zsh/site-functions/key-bindings.zsh
source $(brew --prefix)/opt/sk/share/zsh/site-functions/completion.zsh

source $(brew --prefix)/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

export HOMEBREW_NO_ANALYTICS=1
export EDITOR='nvim'
COMPLETION_WAITING_DOTS="true"
KEYTIMEOUT=1

eval "$(starship init zsh)"
