#!/usr/bin/env bash

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

function ok() {
  printf "$COL_GREEN [ok]$COL_RESET $1\n"
}

function bot() {
  printf "\n$COL_GREEN\[._.]/$COL_RESET - $1\n"
}

function running() {
  printf "$COL_CYAN ⇒ $COL_RESET $1:\n"
}

function action() {
  printf "\n$COL_YELLOW [action]:$COL_RESET\n ⇒ $1\n"
}

function warn() {
  printf "$COL_YELLOW [warning]$COL_RESET $1\n"
}

function error() {
  printf "$COL_RED [error]$COL_RESET $1\n"
}

function yes_or_no() {
  printf "\n$COL_MAGENTA $1 $COL_RESET(y/n) "
  read response
}

function confirmed() {
  if [[ "$response" =~ ^[Yy]$ ]]; then
    return 0
  fi
  return 1
}
