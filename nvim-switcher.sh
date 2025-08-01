#!/bin/bash

# Smart Neovim Config Switcher
# Usage: ./nvim-switcher.sh [stable|nightly]

CONFIG_DIR="$HOME/.config/nvim"
cd "$CONFIG_DIR" || exit 1

if [ "$1" = "nightly" ]; then
    # Check if lua directory exists (indicates we're on stable config)
    if [ -d "lua" ]; then
        echo "Switching to nightly config..."
        rm -rf nvim-stable
        mkdir -p nvim-stable
        mv *.lua nvim-stable/ 2>/dev/null
        mv lua nvim-stable/ 2>/dev/null
        [ -f "lazy-lock.json" ] && mv lazy-lock.json nvim-stable/
        echo "Moved stable config to nvim-stable/"
        echo "Switched to nightly config"
    else
        echo "Error: No lua directory found. Are you on the wrong config?"
        exit 1
    fi
elif [ "$1" = "stable" ]; then
    # Check if we're on nightly (no lua directory, but init.lua exists)
    if [ ! -d "lua" ] && [ -f "init.lua" ]; then
        echo "Switching to stable config..."
        rm -rf nvim-nightly
        mkdir -p nvim-nightly
        mv *.lua nvim-nightly/ 2>/dev/null
        [ -f "lazy-lock.json" ] && mv lazy-lock.json nvim-nightly/
        # Now restore stable config
        if [ -d "nvim-stable" ]; then
            mv nvim-stable/* ./ 2>/dev/null
            rmdir nvim-stable
            echo "Restored stable config"
        else
            echo "Warning: No nvim-stable directory found"
        fi
        echo "Switched to stable config"
    else
        echo "Error: Not on nightly config (expected no lua/ dir but init.lua present)"
        exit 1
    fi
else
    echo "Usage: $0 [stable|nightly]"
    exit 1
fi
