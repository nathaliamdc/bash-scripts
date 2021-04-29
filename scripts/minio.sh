#! /usr/bin/env bash

#############################################
#             Installing minio              #
#############################################
# Use case: client for minio server

echo '[+] Downloading mc (minIO client)...' 
curl -Lo mc https://dl.min.io/client/mc/release/linux-amd64/mc

echo '[+] Installing mc (minIO client)...'
sudo install mc /usr/local/bin/

echo '[+] Cleaning up files...'
rm mc
