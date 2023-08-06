# --------------------------------
# Enable systemd for WSL
# source: https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl/
# --------------------------------

# Set the systemd flag set in your WSL distro settings
if ! grep -qF "[boot]" /etc/wsl.conf; then

  echo "[boot]" >> /etc/wsl.conf

  if ! grep -qF "systemd=true" /etc/wsl.conf; then
    echo "systemd=true" >> /etc/wsl.conf
  fi
fi