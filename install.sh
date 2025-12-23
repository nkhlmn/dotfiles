#!/bin/bash

# Define the source/target pairs
SYMLINKS=(
	"$HOME/dotfiles/zshrc $HOME/.zshrc"
	"$HOME/dotfiles/zshenv $HOME/.zshenv"
	"$HOME/dotfiles/aliases $HOME/.aliases"
	"$HOME/dotfiles/wezterm $HOME/.config/wezterm"
	"$HOME/dotfiles/ghostty $HOME/.config/ghostty"
	"$HOME/dotfiles/fish $HOME/.config/fish"
	"$HOME/dotfiles/alacritty $HOME/.config/alacritty"
	"$HOME/dotfiles/nvim $HOME/.config/nvim"
	"$HOME/dotfiles/starship.toml $HOME/.config/starship.toml"
)

# Loop through the source/target pairs and create symlinks
for PAIR in "${SYMLINKS[@]}"; do
	# Split the pair into source and target
	read -r SOURCE TARGET <<<"$PAIR"

	# Check if the symlink already exists
	if [ ! -e "$TARGET" ]; then
		echo "Creating: $SOURCE -> $TARGET"
		ln -s "$SOURCE" "$TARGET"
	else
		echo "Already exists: $SOURCE -> $TARGET"
	fi
done
