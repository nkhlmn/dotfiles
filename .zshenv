# Activates virtualenv if it exists
# https://vi.stackexchange.com/questions/7644/use-vim-with-virtualenv/7654#7654
if [[ -n $VIRTUAL_ENV && -e "${VIRTUAL_ENV}/bin/activate" ]]; then
  source "${VIRTUAL_ENV}/bin/activate"
fi

# Enable pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
