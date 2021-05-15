#! /usr/bin/env bash

#############################################
#               Constants                   #
#############################################

ALIAS_FILE=~/.bash_aliases
ALIASES=('k=kubectl')


#############################################
#            Helper functions               #
#############################################

# Function to check if alias exists in file 
function alias_exists(){
	local alias=$1
    local file=$2
	if ! grep -q -x -F -e "$alias" <"$file"; then
	  return 1
	fi
	return 0
}


#############################################
#           Installing kubectl              #
#############################################
# Use case: managing Kubernetes

# Download latest release
echo "[+] Downloading kubectl $(curl -L -s https://dl.k8s.io/release/stable.txt)..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Validate binary file
echo '[+] Validating binary file...'
curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo '$(<kubectl.sha256) kubectl' | sha256sum --check

# Install kubectl
echo "[+] Installing kubectl $(curl -L -s https://dl.k8s.io/release/stable.txt)..."
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client

# Cleaning up files
echo '[+] Cleaning up files...'
rm kubectl kubectl.sha256


#############################################
#        Creating shell aliases             #
#############################################
# Use case: shortcuts for commands

echo '[+] Creating shell aliases'

# Checks if ALIAS_FILE file exists and creates it if not
if ! test -f "$ALIAS_FILE"; then
    touch ~/.bash_aliases
fi

## Checks if alias is already in file and adds it if not
for alias in "${ALIASES[@]}"; do
  if ! alias_exists "alias $alias" $ALIAS_FILE; then
  	printf '%s\n' "alias ${alias}" >>"$ALIAS_FILE"
  fi
  
  echo 'Alias created: ' $alias

done


#############################################
#      Installing kubens and kubectx        #
#############################################
# Use case: toggling between contexts and namespaces

echo '[+] Installing kubens and kubectx...'

# Cloning git repository
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx

# Linking binary files
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens


#############################################
#           Installing kubespy              #
#############################################
# Use case: observing changes in Kubernetes resources
# (after applying changes)

echo '[+] Installing kubespy v0.6.0...'

# Downloads the linux binary
curl -LO https://github.com/pulumi/kubespy/releases/download/v0.6.0/kubespy-v0.6.0-linux-amd64.tar.gz

# Creates temporary directory if does not exist
sudo mkdir -p kubespy

# Extracts file to temp directory
sudo tar -xzvf kubespy-v0.6.0-linux-amd64.tar.gz -C kubespy

# Install it
sudo install -o root -g root -m 0755 kubespy/kubespy /usr/local/bin/kubespy

# Cleanup files
echo '[+] Cleaning up files...'
sudo rm -r kubespy kubespy-v0.6.0-linux-amd64.tar.gz


#############################################
#            Installing GnuPG               #
#############################################
# Use case: implementation of PGP encryption protocol
# (backend for Sops secrets encryption)

echo '[+] Installing GnuPG...'

# Install it from package manager
sudo apt-get install gnupg2


#############################################
#              Installing Sops              #
#############################################
# Use case: encrypting individual secret values in Kubernetes

echo '[+] Downloading Sops v3.7.0...'

# Downloads Sops from Github
curl -LO "https://github.com/mozilla/sops/releases/download/v3.7.0/sops_3.7.0_amd64.deb"

echo '[+] Installing Sops v3.7.0...'

# Installs Sops
sudo dpkg -i sops_3.7.0_amd64.deb

# Cleanup files
echo '[+] Cleaning up files...'
sudo rm sops_3.7.0_amd64.deb


#############################################
#             Installing Velero             #
#############################################
# Use case: backing up Kubernetes cluster

echo '[+] Downloading Velero v1.5.4...'

# Downloads Velero from Github
curl -LO "https://github.com/vmware-tanzu/velero/releases/download/v1.5.4/velero-v1.5.4-linux-amd64.tar.gz"

echo '[+] Installing Velero v1.5.4...'

# Extracts file to temp directory
sudo tar -xzvf velero-v1.5.4-linux-amd64.tar.gz

# Move binaries to /usr/local/bin
sudo install -o root -g root -m 0755 velero-v1.5.4-linux-amd64/velero /usr/local/bin/velero

# Cleanup files
echo '[+] Cleaning up files...'
sudo rm -r velero-v1.5.4-linux-amd64 velero-v1.5.4-linux-amd64.tar.gz


#############################################
#               Installing Helm             #
#############################################
# Use case: package manager for Kubernetes
# (used to package single application in a Helm chart)

echo '[+] Downloading Helm v3.5.3...'

# Downloads Helm from Github
curl -LO https://get.helm.sh/helm-v3.5.3-linux-amd64.tar.gz

echo '[+] Installing Helm v3.5.3...'

# Extracts files
sudo tar -xzvf helm-v3.5.3-linux-amd64.tar.gz

# Move binaries to /usr/local/bin
sudo install -o root -g root -m 0755 linux-amd64/helm /usr/local/bin/helm

# Cleanup files
echo '[+] Cleaning up files...'
sudo rm -r linux-amd64 helm-v3.5.3-linux-amd64.tar.gz


#############################################
#           Installing Helmfile             #
#############################################
# Use case: used to deploy several applications
# (each described in a Helm chart)

echo '[+] Downloading Helmfile v0.138.7...'

# Downloads Helmfile from Github
curl -LO https://github.com/roboll/helmfile/releases/download/v0.138.7/helmfile_linux_amd64

echo '[+] Installing Helmfile v0.138.7...'

# Move binaries to /usr/local/bin
sudo install -o root -g root -m 0755 helmfile_linux_amd64 /usr/local/bin/helmfile

echo '[+] Cleaning up files...'
sudo rm helmfile_linux_amd64


#############################################
#          Installing kustomize             #
#############################################
# Use case: install and patch YAML manifests
# P.S.: install standalone kustomize

echo '[+] Downloading kustomize v4.1.2...'
curl -LO https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv4.1.2/kustomize_v4.1.2_linux_amd64.tar.gz

echo '[+] Installing kustomize v4.1.2...'
tar -xzvf kustomize_v4.1.2_linux_amd64.tar.gz
sudo install -o root -g root -m 0755 kustomize /usr/local/bin/kustomize

echo '[+] Cleaning up files...'
rm kustomize kustomize_v4.1.2_linux_amd64.tar.gz


#############################################
#            Installing kubeval             #
#############################################
# Use case: validates Kubernetes YAML files

echo '[+] Installing kubeval...'

# Downloads kubeval from Github
curl -LO https://github.com/instrumenta/kubeval/releases/latest/download/kubeval-linux-amd64.tar.gz

echo '[+] Installing kubeval...'

# Creates temporary directory if does not exist
sudo mkdir -p kubeval

# Extracts kubeval files
sudo tar -xzvf kubeval-linux-amd64.tar.gz -C kubeval

# Installs kubeval
sudo install -o root -g root -m 0755 kubeval/kubeval /usr/local/bin/kubeval

# Cleanup files
echo '[+] Cleaning up files...'
sudo rm -r kubeval kubeval-linux-amd64.tar.gz


