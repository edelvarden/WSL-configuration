@echo off
:: Ensure admin privileges
fltmc >nul 2>&1 || (
    echo Administrator privileges are required.
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo Right-click on the script and select "Run as administrator".
        pause & exit 1
    )
    exit 0
)

@REM Base installation
wsl.exe -d kali-linux --user root sh -c "bash install.sh"


@REM Install ohmyposh with json theme. https://ohmyposh.dev/
wsl.exe -d kali-linux --user root sh -c "curl -s https://ohmyposh.dev/install.sh | bash -s"
wsl.exe -d kali-linux sh -c "cat powerlevel10k_rainbow.omp.json > ~/powerlevel10k_rainbow.omp.json"
wsl.exe -d kali-linux sh -c "bash install_ohmyposh.sh"


@REM Install docker
wsl.exe -d kali-linux --user root sh -c "bash install_docker.sh"


@REM Install systemd
wsl.exe -d kali-linux --user root sh -c "bash install_systemd.sh"
wsl.exe --shutdown

echo ----------------------------------------------------------------
echo Installation completed.

pause
@REM exit /b 0