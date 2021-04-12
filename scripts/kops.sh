#! /usr/bin/env bash

#############################################
#              Installing kops              #
#############################################
# Use case: install Kubernetes from scratch

# Downloads kops
echo "[+] Downloading kops $(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)..."
curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops

# Installs kops
echo "[+] Installing kops $(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)..."
sudo mv kops /usr/local/bin/kops

