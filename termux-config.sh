#!/bin/bash
# Termux startup and Neovim setup script

source ./termux.property || { touch termux.property }
echo $preconfig

exit 0
# Function to check and handle errors
check_error() {
    if [ $? -ne 0 ]; then
        echo "Error occurred. Exiting..."
        exit 1
    fi
}

# Function to install a package
install_package() {
    pkg install "$1" -y || { echo "Error installing $1"; exit 1; }
    echo "$1 installed"
}

echo "TERMUX STARTUP"

# Prompt for storage access
termux-setup-storage || { echo "Error setting up storage"; exit 1; }

# Change termux repository
termux-change-repo || { echo "Error changing repository"; exit 1; }

echo "Updating and upgrading Termux"
pkg update -y || { echo "Error updating"; exit 1; }
pkg upgrade -y || { echo "Error upgrading"; exit 1; }

echo "Installing packages and dependencies"
echo "-----------------------------"

# List of packages to install (optimized for mobile)
# packages="python neovim nodejs git curl openssl openssh wget gh ruby php golang rust build-essential clang vim tmux sqlite imagemagick neofetch tree nano htop proot-distro fortune cowsay cmatrix"
packages="fzf"

for package in $packages; do
    install_package "$package"
done

exit 0

# Mobile-specific optimizations
echo "Setting up mobile-specific configurations..."
echo "-----------------------------------"

