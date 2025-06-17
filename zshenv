. "$HOME/.cargo/env"

export HOMEBREW_NO_ANALYTICS=1

export GREP_OPTIONS='--color=always'

export EDITOR='nvim'

COMPLETION_WAITING_DOTS="true"

KEYTIMEOUT=1

export FZF_CTRL_T_OPTS="
  --style minimal
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export FZF_CTRL_R_OPTS="
  --style minimal
  --color header:italic"
