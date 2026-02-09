#!/usr/bin/env bash

set -e

echo "Installing Tailscale..."

curl -fsSL https://tailscale.com/install.sh | sh

TAILSCALE_AUTH_KEY="tskey-auth-kMaS2AdHT411CNTRL-3ymYjPks64fKzNgeuubn4fgRerWyeT7k2"

echo "Starting Tailscale..."
sudo tailscaled & sleep 2

sudo tailscale up --authkey "$TAILSCALE_AUTH_KEY" --accept-routes --accept-dns

echo "Tailscale is running"
tailscale ip -4
