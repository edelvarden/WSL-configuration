# --------------------------------
# Resolving Git line ending issues in WSL (resulting in many modified files)
# source: https://code.visualstudio.com/docs/remote/troubleshooting#_resolving-git-line-ending-issues-in-wsl-resulting-in-many-modified-files
# This script adds the following lines to the `.gitattributes` file:
: '
* text=auto eol=lf
*.{cmd,[cC][mM][dD]} text eol=crlf
*.{bat,[bB][aA][tT]} text eol=crlf
 '
# --------------------------------

# Check if the `.config/git/attributes` directory exists.
if [ ! -d "$HOME/.config/git/attributes" ]; then
  # Create the directory.
  mkdir -p "$HOME/.config/git/attributes"
fi

# Check if the `.gitattributes` file exists in the `.config/git/attributes` directory.
if [ ! -f "$HOME/.config/git/attributes/.gitattributes" ]; then
  # Create the file.
  touch "$HOME/.config/git/attributes/.gitattributes"
fi

# Check if the following lines already exist in the `.gitattributes` file.
lines_to_check=(
  "* text=auto eol=lf"
  "*.{cmd,[cC][mM][dD]} text eol=crlf"
  "*.{bat,[bB][aA][tT]} text eol=crlf"
)

for line in "${lines_to_check[@]}"; do
  if ! grep -q "$line" "$HOME/.config/git/attributes/.gitattributes"; then
    echo "$line" >> "$HOME/.config/git/attributes/.gitattributes"
  fi
done

# Add the global path to `.gitattributes` to the git configuration.
git config --global core.attributesfile "$HOME/.config/git/attributes/.gitattributes"


# --------------------------------
# Enable systemd for WSL
# source: https://devblogs.microsoft.com/commandline/systemd-support-is-now-available-in-wsl/
# --------------------------------

# Set the systemd flag set in your WSL distro settings (Requires WSL reboot)
if ! grep -qF "[boot]" /etc/wsl.conf; then

  echo "[boot]" >> /etc/wsl.conf

  if ! grep -qF "systemd=true" /etc/wsl.conf; then
    echo "systemd=true" >> /etc/wsl.conf
  fi
fi
