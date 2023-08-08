#!/bin/bash

# Get the current working directory
scriptroot=$(pwd)

# Check if the .bashrc file exists
if [ ! -f "$scriptroot/.bashrc" ]; then
  echo "The .bashrc file does not exist."
  exit 1
fi

# Check if the user has write permissions to the .bashrc file
if [ ! -w "$scriptroot/.bashrc" ]; then
  echo "The user does not have write permissions to the .bashrc file."
  exit 1
fi

# Get the contents of the .bashrc file
custom_bashrc_content=$(cat "$scriptroot/.bashrc")

# Check if the bashrc_content exists in the .bashrc file
if ! grep -q 'eval "$(oh-my-posh init bash --config ~/powerlevel10k_rainbow.omp.json)"' ~/.bashrc; then
  echo "$custom_bashrc_content" >> ~/.bashrc
else
  echo "Custom .bashrc upgrades already added!"
fi