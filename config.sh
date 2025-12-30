#!/bin/bash

# 1. Changing terminal view
echo -e '\e[1;31m1. Changing terminal view...\e[0m'

if grep -q "export PS1" ~/.bashrc; then
    echo -e '\e[1;33mStyle exists. Skipping. \e[0m'
else
    echo 'export PS1="[\e[1;36m\u\e[0m][\e[1;36m\h\e[0m][\e[1;32m\w\e[0m] > "' >> ~/.bashrc
    echo "Style added."
fi

source ~/.bashrc

# 2. Adding aliases
echo -e '\e[1;31m2. Adding own aliases... \e[0m '
if [ ! -f ~/.bash_aliases ]; then
    touch ~/.bash_aliases
fi

UPDATE_CMD='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'
REBOOT_CMD='sudo reboot'

# Check if alias exists before adding to avoid duplicates
if ! grep -q "alias update=" ~/.bash_aliases; then
    echo "alias update=\"$UPDATE_CMD\"" >> ~/.bash_aliases
fi

if ! grep -q "alias reboot=" ~/.bash_aliases; then
    echo "alias reboot=\"$REBOOT_CMD\"" >> ~/.bash_aliases
fi

source ~/.bash_aliases

# 3. Updating system
echo -e '\e[1;31m3. Updating system... \e[0m'

eval "$UPDATE_CMD"

# 4. Install some useful apps
APPS='vim htop fastfetch'

echo -e '\e[1;31m4. Installing apps...'
for app in $APPS; do
    sudo apt install -y "$app"
done

echo -e '\e[1;32mConfig done. \e[0m'
