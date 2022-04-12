#! /usr/bin/env bash

#############################################
#             Installing Stripe             #
#############################################
# Use case: testing Stripe integration

echo "[+] Downloading Stripe CLI..."
curl -Lo stripe https://github.com/stripe/stripe-cli/releases/download/v1.8.6/stripe_1.8.6_linux_x86_64.tar.gz

echo "[+] Extracting the archive..."
tar -xzvf stripe

echo "[+] Installing Stripe CLI..."
sudo mv stripe /usr/local/bin/stripe
