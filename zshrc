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

  # zsh-vi-mode will execute this after initializing
  function zvm_after_init() {
    source <(fzf --zsh) # Set up fzf key bindings and fuzzy completion
  }
fi


# opam configuration
[[ ! -r /Users/nkhl/.opam/opam-init/init.zsh ]] || source /Users/nkhl/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

