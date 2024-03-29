#! /usr/bin/env bash

echo "[+] Downloading buf..."
# Substitute PREFIX for your install prefix.
# Substitute VERSION for the current released version.
PREFIX="/usr/local"
VERSION="1.10.0"
curl -LO "https://github.com/bufbuild/buf/releases/download/v${VERSION}/buf-$(uname -s)-$(uname -m).tar.gz"

echo "[+] Installing buf..."
sudo tar -xvzf buf-$(uname -s)-$(uname -m).tar.gz -C "${PREFIX}" --strip-components 1

echo "[+] Cleaning up files..."
rm -r buf-$(uname -s)-$(uname -m).tar.gz