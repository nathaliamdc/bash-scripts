#! /usr/bin/env bash

#############################################
#          Installing Terraform             #
#############################################

echo '[+] Downloading Terraform v0.14.10...'
curl -LO https://releases.hashicorp.com/terraform/0.14.10/terraform_0.14.10_linux_amd64.zip

# Creates temporary directory if does not exist
sudo mkdir -p terraform

# Extracts file to temp directory
sudo unzip terraform_0.14.10_linux_amd64.zip -d terraform

# Install it
echo '[+] Installing Terraform v0.14.10...'
sudo install -o root -g root -m 0755 terraform/terraform /usr/local/bin/terraform

# Cleanup files
echo '[+] Cleaning up files...'
sudo rm -r terraform terraform_0.14.10_linux_amd64.zip

