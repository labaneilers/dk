#!/bin/bash

cd $(dirname "$0")

if [ "$DK_DIR" = "" ]; then
    DK_DIR="$HOME/bin"
fi

DK_BIN_PATH="$DK_DIR/dk"

echo "Installing dk to $DK_BIN_PATH..."

mkdir -p ~/bin
curl -s -f -S -o "$DK_BIN_PATH" https://raw.githubusercontent.com/labaneilers/dk/master/dk
ERROR="$?"
if [ ! "$ERROR" = "0" ]; then
    echo "Failed to download"
    exit 1
fi

chmod +x "$DK_BIN_PATH"

TESTED=$(which dk)
if [[ "$TESTED" = "" ]]; then
    echo "dk was installed at $DK_BIN_PATH, but it wasn't on your PATH."
    exit 1
fi

echo "dk installed successfully at $DK_BIN_PATH"