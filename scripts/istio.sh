#! /usr/bin/env bash

echo "[+] Downloading Istio..."
curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.11.4 sh -

echo "[+] Installing Istio..."
sudo mv istio-1.11.4/bin/istioctl /usr/local/bin/istioctl

echo "[+] Cleaning up files..."
sudo rm -r istio-1.11.4
