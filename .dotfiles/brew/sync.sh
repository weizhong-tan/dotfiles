#!/usr/bin/env bash
brew bundle dump --formula --cask --tap -f

# Delete any private taps or formulae
sed -i '' '/deliveroo/d' Brewfile
