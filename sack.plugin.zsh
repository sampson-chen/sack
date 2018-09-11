sack__install_sackrc=$HOME
sack__install_cwd=${0:h}

# Add sack helpers to binary path
export PATH="$sack__install_cwd:$PATH"

# Create .sackrc if it does not yet exist.
if [[ ! -f "$sack__install_sackrc/.sackrc" ]]; then
  echo "[sack] Creating new rcfile at '$sack__install_sackrc/.sackrc'..."
  cp "$sack__install_cwd/.sackrc" "$sack__install_sackrc"
fi
