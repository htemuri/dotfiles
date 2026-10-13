#!/usr/bin/env bash

# tool enable flags
ENABLE_EMACS=1

# prompt for tools
read -p "Configure Emacs? (Y/n): " ENABLE_EMACS

case $ENABLE_EMACS in
  ""|Y|y) ENABLE_EMACS=1 ;;
  N|n) ENABLE_EMACS=0 ;;
  *) echo "Invalid choice. Exiting..."; exit 1 ;;
esac

# setup emacs
