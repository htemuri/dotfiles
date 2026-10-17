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
if [ "$ENABLE_EMACS" -eq 1 ] ; then
    # backup old config
    if [ -e "$HOME/.emacs" ]; then
        mv -- "$HOME/.emacs" "$HOME/.emacs.bak"
    fi
    if [ -e "$HOME/.emacs.d" ]; then
        mv -- "$HOME/.emacs.d" "$HOME/.emacs.d.bak"
    else
        mkdir "$HOME/.emacs.d"
    fi 
    for file in "$PWD"/emacs/*; do
        [ -f "$file" ] || continue # keeps only files
        [[ "${file##*/}" == "emacs.service"
                || "${file##*/}" == "emacs.desktop"
         ]] && continue # skips unwanted files
        [ -e "$HOME/.emacs.d/${file##*/}" ] && continue # skip already linked files
        ln -s "$file" "$HOME/.emacs.d/"
    done
    echo "Successfully setup Emacs!"
fi
