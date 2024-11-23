#!/bin/bash

# List of packages to install
PACKAGES=("universal-ctags")
# for build c/c++ files
PACKAGES+=("build-essential")
# diagnostics
PACKAGES+=("clangd")

# Function to check if a package is installed
is_installed() {
    dpkg -l "$1" &>/dev/null
}

# Update package list
sudo apt-get update

# Install missing packages
for pkg in "${PACKAGES[@]}"; do
    if ! is_installed "$pkg"; then
        echo "Installing $pkg..."
        sudo apt-get install -y "$pkg"
    else
        echo "$pkg is already installed."
    fi
done
