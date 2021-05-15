#! /usr/bin/env bash

echo "[+] Downloading Go..."
curl -Lo go1.16.4.linux-amd64.tar.gz https://golang.org/dl/go1.16.4.linux-amd64.tar.gz

echo "[+] Extracting the archive..."
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go1.16.4.linux-amd64.tar.gz

echo "[+] Adding binary to PATH..."
echo 'export PATH=${PATH}:/usr/local/go/bin' >>$HOME/.profile

# Changes made to a profile file may not apply until the next time you log into your computer.
# To apply the changes immediately, just run the shell commands directly or execute them from the profile using the command
# source $HOME/.profile

echo "[+] Cleaning up files..."
rm go1.16.4.linux-amd64.tar.gz