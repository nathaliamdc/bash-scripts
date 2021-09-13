#! /usr/bin/env bash

#############################################
#        Installing Sealed Secrets          #
#############################################
# Use case: encrypting Kubernetes Secrets

echo '[+] Downloading Sealed Secrets CLI...' 
wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.16.0/kubeseal-linux-amd64 -O kubeseal

echo '[+] Installing Sealed Secrets CLI...' 
sudo install -m 755 kubeseal /usr/local/bin/kubeseal

echo '[+] Cleaning up files...'
rm kubeseal
