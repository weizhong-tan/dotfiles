#!/usr/bin/env bash
brew bundle dump --formula --cask --tap --mas -f

# Only include private taps or formulae
sed -i '' '/deliveroo/!d' Brewfile
