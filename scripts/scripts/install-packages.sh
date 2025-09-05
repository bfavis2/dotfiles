#!/bin/bash

# Install AUR packages using yay
yay -S --noconfirm --needed \
  stow zellij \
  pipewire wireplumber pipewire-pulse \
  sof-firmware pipewire-audio pipewire-alsa \
  alsa-mixer pipewire-docs \
  calibre
