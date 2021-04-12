#! /usr/bin/env bash

#############################################
#           Installing AWS CLI              #
#############################################
# Installs the AWS CLI version 2
 
echo '[+] Downloading AWS CLI...' 
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip

echo '[+] Installing AWS CLI...'
sudo ./aws/install

echo '[+] Cleaning up files...'
sudo rm -r aws awscliv2.zip

echo '[+] Configuring IAM user credentials...'
aws configure


