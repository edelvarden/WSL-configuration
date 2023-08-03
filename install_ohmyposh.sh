# --------------------------------
# Install ohmyposh https://ohmyposh.dev/
# --------------------------------
curl -s https://ohmyposh.dev/install.sh | bash -s

# Check if the string is already in the .bashrc file
if ! grep -qF "eval \"\$(oh-my-posh init bash --config ~/powerlevel10k_rainbow.omp.json)\"" ~/.bashrc; then

  # Add the string to the end of the .bashrc file
  echo "eval \"\$(oh-my-posh init bash --config ~/powerlevel10k_rainbow.omp.json)\"" >> ~/.bashrc
fi
