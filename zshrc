bindkey -v # vim keybindings

[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.aliases.local ] && source ~/.aliases.local
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/opt/sk/share/zsh/site-functions/key-bindings.zsh
source /opt/homebrew/opt/sk/share/zsh/site-functions/completion.zsh
source /opt/homebrew/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

export HOMEBREW_NO_ANALYTICS=1
export EDITOR='nvim'
COMPLETION_WAITING_DOTS="true"
KEYTIMEOUT=1

eval "$(starship init zsh)"
