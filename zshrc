[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.aliases.local ] && source ~/.aliases.local

eval "$(starship init zsh)"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit

  source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source $(brew --prefix)/opt/sk/share/zsh/site-functions/key-bindings.zsh
  source $(brew --prefix)/opt/sk/share/zsh/site-functions/completion.zsh
fi

