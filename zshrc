[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.aliases.local ] && source ~/.aliases.local

source $(brew --prefix)/opt/sk/share/zsh/site-functions/key-bindings.zsh
source $(brew --prefix)/opt/sk/share/zsh/site-functions/completion.zsh

export HOMEBREW_NO_ANALYTICS=1
export EDITOR='nvim'
COMPLETION_WAITING_DOTS="true"
KEYTIMEOUT=1

eval "$(starship init zsh)"

source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
