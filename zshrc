[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.aliases.local ] && source ~/.aliases.local

eval "$(starship init zsh)"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit

  source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

  # The plugin will auto execute this zvm_after_init function
  function zvm_after_init() {
    source $(brew --prefix)/opt/sk/share/zsh/site-functions/key-bindings.zsh
    source $(brew --prefix)/opt/sk/share/zsh/site-functions/completion.zsh
  }
fi

# opam configuration
[[ ! -r /Users/nkhl/.opam/opam-init/init.zsh ]] || source /Users/nkhl/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

