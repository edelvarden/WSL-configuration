# Base installation
wsl.exe -d "Ubuntu" --user root sh -c "bash install.sh"
wsl.exe -d "Ubuntu" --user root sh -c "npm install --global yarn typescript"


# Install ohmyposh with json theme | https://ohmyposh.dev/
wsl.exe -d "Ubuntu" --user root sh -c "curl -s https://ohmyposh.dev/install.sh | bash -s"
wsl.exe -d "Ubuntu" sh -c "cat powerlevel10k_rainbow.omp.json > ~/powerlevel10k_rainbow.omp.json"
wsl.exe -d "Ubuntu" sh -c "bash install_ohmyposh.sh"


# Install docker
wsl.exe -d "Ubuntu" --user root sh -c "bash install_docker.sh"

Write-Host "Done."