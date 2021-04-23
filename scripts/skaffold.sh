#! /usr/bin/env bash

#############################################
#           Installing skaffold             #
#############################################
# Use case: create a CI/CD environment

echo '[+] Downloading skaffold...' 
# For Linux AMD64
curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64

echo '[+] Installing skaffold...'
sudo install skaffold /usr/local/bin/

echo '[+] Cleaning up files...'
rm skaffold
