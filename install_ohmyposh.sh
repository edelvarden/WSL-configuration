# --------------------------------
# Add ohmyposh json theme string to bash configuration
# --------------------------------

# Check if the string is already in the .bashrc file
if ! grep -qF "eval \"\$(oh-my-posh init bash --config ~/powerlevel10k_rainbow.omp.json)\"" ~/.bashrc; then

  # Add the string to the end of the .bashrc file
  echo "eval \"\$(oh-my-posh init bash --config ~/powerlevel10k_rainbow.omp.json)\"" >> ~/.bashrc
fi
