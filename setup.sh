#!/bin/zsh
# Tim H 2025

set -e # bail on error

# MacOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install --formula --quiet git gh elfio findutils
    gfind . -type f -iname '*.sh' ! -executable -exec chmod +x "{}" \;


# Ubuntu
elif [[ -f /etc/os-release ]]; then
    . /etc/os-release
    if [[ "$ID" == "ubuntu" ]]; then
        sudo apt-get update
        # sudo apt install -y build-essential cmake wget git gh distcc binutils elfutils libdw-dev patchelf expect autoexpect
        

    else
        echo "Other Linux: $ID"
        exit 1
    fi
    find . -type f -iname '*.sh' ! -executable -exec chmod +x "{}" \;
else
    echo "Unknown OS"
    exit 2
fi
