#! /usr/bin/env bash

echo "[+] Updating apt package index..."
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo "[+] Adding Docker's official GPG key"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "[+] Setting up stable docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "[+] Installing Docker engine..."
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

echo "[+] Logging in to Docker Registry..."
docker login