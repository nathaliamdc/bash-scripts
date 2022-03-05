#! /usr/bin/env bash

#############################################
#            Installing Packer              #
#############################################

echo '[+] Adding HashiCorp repository...'
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# Install it
echo '[+] Installing Packer...'
sudo apt-get update && sudo apt-get install packer

