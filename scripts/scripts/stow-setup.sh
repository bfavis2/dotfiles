#!/bin/bash

stow -d ~/dotfiles -t ~ \
  --adopt \
  --verbose=3 \
  --stow aliases \
  --stow backgrounds \
  --stow btop \
  --stow config-root \
  --stow fastfetch \
  --stow hypr \
  --stow kitty \
  --stow nvim-bfavis \
  --stow nvim-lazyvim \
  --stow scripts \
  --stow starship \
  --stow walker \
  --stow waybar \
  --stow wezterm \
  --stow zellij \
  --stow zsh
# --simulate
