#!/usr/bin/env bash
# This script creates a new 2GB swap file and enables it on Ubuntu.

# 1. Define swap size in gigabytes
SWAP_SIZE_GB=2

# 2. Create the swap file
sudo fallocate -l ${SWAP_SIZE_GB}G /swapfile || {
  echo "Error: Unable to create swapfile. Check disk space or permissions."
  exit 1
}

# 3. Secure the swap file by setting appropriate permissions
sudo chmod 600 /swapfile || {
  echo "Error: Unable to set permissions on /swapfile."
  exit 1
}

# 4. Format the file as swap
sudo mkswap /swapfile || {
  echo "Error: Unable to format /swapfile as swap."
  exit 1
}

# 5. Enable the new swap file
sudo swapon /swapfile || {
  echo "Error: Unable to enable swap."
  exit 1
}

# 6. Persistence across reboots - add entry to /etc/fstab if not already present
if ! grep -q '/swapfile' /etc/fstab; then
  echo "/swapfile none swap sw 0 0" | sudo tee -a /etc/fstab
fi

echo "Swap has been successfully created and enabled. Current swap details:"
sudo swapon --show
free -h
