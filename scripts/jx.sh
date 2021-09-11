#! /usr/bin/env bash

#############################################
#            Installing Jenkins X           #
#############################################
# Use case: cloud-native CI/CD

curl -L https://github.com/jenkins-x/jx/releases/download/v3.2.196/jx-linux-amd64.tar.gz | tar xzv
chmod +x jx 
sudo mv jx /usr/local/bin