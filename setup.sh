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
    
    backup_suffix=$(date +%Y%m%d-%H%M%S)
    
    # backup old config
    if [ -e "$HOME/.emacs" ]; then
        mv -- "$HOME/.emacs" "$HOME/.emacs.bak-$backup_suffix"
    fi
    if [ -e "$HOME/.emacs.d" ]; then
        mv -- "$HOME/.emacs.d" "$HOME/.emacs.d.bak-$backup_suffix"
    fi
    
    mkdir "$HOME/.emacs.d"
     
    for file in "$PWD"/emacs/*; do
        [ -f "$file" ] || continue # keeps only files

        case "${file##*/}" in
            emacs.service|emacs.desktop) continue ;;
        esac # skips unwanted files
        
        ln -s -- "$file" "$HOME/.emacs.d/"
    done
    echo "Successfully setup Emacs!"
fi
