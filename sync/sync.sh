#!/bin/bash

# Target destination repository directory
REPO_DIR="$HOME/Dotfiles"

echo "========================================"
echo " Starting Dotfiles Backup Configuration "
echo "========================================"

# --- 1. KDE DESKTOP ENVIRONMENT CONFIGURATIONS ---
echo "--> Backing up KDE configuration files..."
KDE_CONFIG_DIR="$REPO_DIR/kde/.config"
mkdir -p "$KDE_CONFIG_DIR"

KDE_CONFIG_FILES=(
    "kdeglobals"
    "kglobalshortcutsrc"
    "plasmarc"
    "plasma-org.kde.plasma.desktop-appletsrc"
)

for file in "${KDE_CONFIG_FILES[@]}"; do
    if [ -f "$HOME/.config/$file" ]; then
        cp "$HOME/.config/$file" "$KDE_CONFIG_DIR/$file"
        echo "   [✓] Copied: $file"
    fi
done

echo "--> Backing up KDE local share folders..."
KDE_SHARE_DIR="$REPO_DIR/kde/.local/share"
mkdir -p "$KDE_SHARE_DIR"

KDE_SHARE_DIRS=(
    "color-schemes"
    "plasma"
    "aurorae"
)

for dir in "${KDE_SHARE_DIRS[@]}"; do
    if [ -d "$HOME/.local/share/$dir" ]; then
        cp -r "$HOME/.local/share/$dir" "$KDE_SHARE_DIR/"
        echo "   [✓] Copied directory: $dir"
    fi
done


# --- 2. ZSH SHELL CONFIGURATIONS ---
echo "--> Backing up Zsh configurations..."
ZSH_REPO_DIR="$REPO_DIR/zsh/.config/zsh"
mkdir -p "$ZSH_REPO_DIR"

# Backup your main Zsh config folder
if [ -d "$HOME/.config/zsh" ]; then
    cp -r "$HOME/.config/zsh/." "$ZSH_REPO_DIR/"
    echo "   [✓] Copied Zsh custom config directory (~/.config/zsh)"
fi

# Backup global fallback profile file if it exists
if [ -f "$HOME/.zshrc" ]; then
    cp "$HOME/.zshrc" "$REPO_DIR/zsh/"
    echo "   [✓] Copied fallback: .zshrc"
fi


# --- 3. KONSOLE TERMINAL PROFILE ---
echo "--> Backing up Konsole profiles..."
KONSOLE_REPO_DIR="$REPO_DIR/konsole/.local/share/konsole"
mkdir -p "$KONSOLE_REPO_DIR"

if [ -d "$HOME/.local/share/konsole" ]; then
    cp -r "$HOME/.local/share/konsole/." "$KONSOLE_REPO_DIR/"
    echo "   [✓] Copied terminal color schemes and configurations."
fi


# --- 4. NEOVIM CONFIGURATIONS ---
echo "--> Backing up Neovim scripts..."
NVIM_REPO_DIR="$REPO_DIR/nvim/.config/nvim"
mkdir -p "$NVIM_REPO_DIR"

if [ -d "$HOME/.config/nvim" ]; then
    # Use rsync if available, or cp with clear exclusions to skip heavy plugin data caches
    if command -v rsync &> /dev/null; then
        rsync -av --exclude='.git' "$HOME/.config/nvim/" "$NVIM_REPO_DIR/" &> /dev/null
    else
        cp -r "$HOME/.config/nvim/." "$NVIM_REPO_DIR/"
    fi
    echo "   [✓] Copied Neovim configuration settings."
fi


# --- 5. INSTALLED SYSTEM PACKAGES LIST ---
echo "--> Exporting active system package lists..."
if command -v pacman &> /dev/null; then
    pacman -Qqen > "$REPO_DIR/pkglist.txt"
    echo "   [✓] Saved Arch Linux package list."
elif command -v apt-get &> /dev/null; then
    dpkg --get-selections > "$REPO_DIR/pkglist.txt"
    echo "   [✓] Saved Debian/Ubuntu package list."
elif command -v dnf &> /dev/null; then
    dnf history userinstalled > "$REPO_DIR/pkglist.txt"
    echo "   [✓] Saved Fedora package list."
fi

echo "========================================"
echo "        Backup Sync Completed!         "
echo "========================================"

