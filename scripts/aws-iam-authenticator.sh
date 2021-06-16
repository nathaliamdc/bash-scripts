#! /usr/bin/env bash

#############################################
#     Installing aws-iam-authenticator      #
#############################################

echo '[+] Downloading aws-iam-authenticator...' 
curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/aws-iam-authenticator


echo '[+] Installing aws-iam-authenticator...'
sudo install -o root -g root -m 0755 ./aws-iam-authenticator /usr/local/bin/aws-iam-authenticator

echo '[+] Cleaning up files...'
sudo rm -r ./aws-iam-authenticator