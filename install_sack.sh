#!/bin/bash
#
# @filename: install_sack.sh
# 
# @author Sampson L. Chen (sampson-chen / slchen)
# @date 2012-10-14
#
# @description:
# Sack auto-install script
# 
# @usage:
# run this script from where the git repo is cloned to.

# sack installation variables
sack__install_main=$HOME/bin
sack__install_sackrc=$HOME
sack__install_cwd=$(pwd)

# If the install directory doesn't exist, create it
if [[ ! -d "$sack__install_main" ]]; then
    echo "Creating '$sack__install_main'..."
    mkdir "$sack__install_main"
fi

# If ack is not installed, install it
if [[ `which ack | wc -l` -eq 0 ]]; then
    echo "Downloading 'ack' to '$sack__install_main/ack'..."
    # FIXME: https
    curl -s -L http://betterthangrep.com/ack-standalone \
        > $sack__install_main/ack && chmod 0755 $sack__install_main/ack

    if (( $? )); then
        echo
        echo "ACK! There was a problem downloading 'ack' from betterthangrep.com" >&2
        echo "     Bailing out." >&2
        echo
        exit 1
    fi
fi

# No install script for ag, so let it be a TODO

echo "Copying 'sack' to '$sack__install_main/sack'..."
cp "$sack__install_cwd/sack" "$sack__install_main"
chmod +x "$sack__install_main/sack"

echo "Copying 'sag' to '$sack__install_main/sag'..."
cp "$sack__install_cwd/sag" "$sack__install_main"
chmod +x "$sack__install_main/sag"

if [[ -f "$sack__install_sackrc/.sackrc" ]]; then
    echo >&2
    echo "It seems you already have a .sackrc from a previous install." >&2
    echo >&2
    echo "Overwrite this with a fresh copy from the source distribution" >&2
    echo "(losing your customizations)?" >&2
    echo >&2
    read -p "(Ctrl+C to quit) y/[N]? " ANS
    if [[ $ANS =~ ^[Yy] ]]; then
        echo
        echo "Overwriting your existing rcfile at '$sack__install_main/.sackrc'..."
        cp "$sack__install_cwd/.sackrc" "$sack__install_sackrc"
    else
        echo
        echo "Okay, not overwriting your existing .sackrc."
    fi
else
    echo "Creating new rcfile at '$sack__install_main/.sackrc'..."
    cp "$sack__install_cwd/.sackrc" "$sack__install_sackrc"
fi

echo
echo "All done."
