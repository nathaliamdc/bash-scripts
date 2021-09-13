#! /usr/bin/env bash

#############################################
#             Installing ArgoCD             #
#############################################
# Use case: deploying apps in Kubernetes

echo "[+] Downloading ArgoCD..."
curl -Lo argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
chmod +x argocd

echo "[+] Installing ArgoCD..."
sudo mv argocd /usr/local/bin/argocd