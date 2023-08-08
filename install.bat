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

@REM Upgrade bashrc
echo ----------------------------------------------------------------
echo Upgrading bashrc...
wsl.exe -d Ubuntu --cd %~dp0 --user user sh -c "bash upgrade_bashrc.sh"  && (
  echo bashrc upgraded.
) || (
  echo Failed to upgrade bashrc!
)


@REM Base installation
echo ----------------------------------------------------------------
echo Installing base packages...
wsl.exe -d Ubuntu --cd %~dp0 --user root sh -c "bash install.sh"  && (
  echo Base packages installed.
) || (
  echo Failed to install base packages!
)


@REM Install ohmyposh with json theme. https://ohmyposh.dev/
echo ----------------------------------------------------------------
echo Installing ohmyposh with json theme...
wsl.exe -d Ubuntu --cd %~dp0 --user root sh -c "curl -s https://ohmyposh.dev/install.sh | bash -s"
wsl.exe -d Ubuntu --cd %~dp0 --user user sh -c "cat powerlevel10k_rainbow.omp.json > ~/powerlevel10k_rainbow.omp.json"


@REM Install docker
echo ----------------------------------------------------------------
echo Installing Docker...
wsl.exe -d Ubuntu --cd %~dp0 --user root sh -c "bash install_docker.sh"  && (
  echo Docker installed.
) || (
  echo Failed to install Docker!
)


@REM Apply WSL fixes
echo ----------------------------------------------------------------
echo Appling WSL fixes...
wsl.exe -d Ubuntu --cd %~dp0 --user root sh -c "bash apply_fixes.sh"  && (
  echo Fixes applied.
) || (
  echo Failed to apply fixes!
)
wsl.exe --shutdown


echo ----------------------------------------------------------------
echo Installation completed.

pause
@REM exit /b 0
