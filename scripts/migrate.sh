#! /usr/bin/env bash

#############################################
#            Installing migrate             #
#############################################
# Use case: CLI for creating and aplying 
# database migrations

version=v4.15.1
platform=linux

echo '[+] Downloading migrate...' 
curl -LO https://github.com/golang-migrate/migrate/releases/download/$version/migrate.$platform-amd64.tar.gz

echo "[+] Extracting the archive..."
mkdir -p migrate
tar -xzvf migrate.$platform-amd64.tar.gz -C migrate

echo '[+] Installing migrate...'
sudo install migrate/migrate /usr/local/bin/migrate

echo "[+] Cleaning up files..."
rm -r migrate.$platform-amd64.tar.gz migrate

