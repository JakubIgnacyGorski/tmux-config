#!/usr/bin/env bash

# Directories and files
CONFIG_FILE="$HOME/.tmux.conf"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPT_NAME="$(basename "${BASH_SOURCE[0]}")" 

backup_config_file () {
    # Sprawdź, czy istnieje i nie jest symlinkiem
    [[ ! -f "$CONFIG_FILE" || -L "$CONFIG_FILE" ]] && return
    if [[ -e "$CONFIG_FILE.backup" ]] ; then 
        i=1
        while [[ -e "$CONFIG_FILE.backup$i" ]]; do
            ((i++))
        done
        cp "$CONFIG_FILE" "$CONFIG_FILE.backup$i"
        echo "Backup created: $CONFIG_FILE.backup$i"
    else
        cp "$CONFIG_FILE" "$CONFIG_FILE.backup"
        echo "Backup created: $CONFIG_FILE.backup"
    fi
}

setup_symlinks () {
    ln -s -f "$SCRIPT_DIR/.tmux.conf" "$CONFIG_FILE"
}

setup_tpm () {
    local PLUGIN_DIR="$HOME/.tmux/plugins/tpm"
    if [[ ! -d "$PLUGIN_DIR" ]] ; then
        git clone https://github.com/tmux-plugins/tpm "$PLUGIN_DIR"
    fi
    "$HOME"/.tmux/plugins/tpm/bin/install_plugins
}

backup_config_file 
setup_symlinks 
setup_tpm 
