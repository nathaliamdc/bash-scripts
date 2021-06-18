#! /usr/bin/env bash

#############################################
#          Installing Terraform             #
#############################################

echo '[+] Downloading Terraform v1.0.0...'
curl -LO https://releases.hashicorp.com/terraform/1.0.0/terraform_1.0.0_linux_amd64.zip

# Creates temporary directory if does not exist
sudo mkdir -p terraform

# Extracts file to temp directory
sudo unzip terraform_1.0.0_linux_amd64.zip -d terraform

# Install it
echo '[+] Installing Terraform v1.0.0...'
sudo install -o root -g root -m 0755 terraform/terraform /usr/local/bin/terraform

# Cleanup files
echo '[+] Cleaning up files...'
sudo rm -r terraform terraform_1.0.0_linux_amd64.zip

