!/bin/bash

# https://docs.saltproject.io/salt/install-guide/en/latest/topics/install-by-operating-system/linux-deb.html

sudo apt install curl -y

# Ensure keyrings dir exists
mkdir -p /etc/apt/keyrings
# Download public key
curl -fsSL https://packages.broadcom.com/artifactory/api/security/keypair/SaltProjectKey/public | sudo tee /etc/apt/keyrings/salt-archive-keyring.pgp
# Create apt repo target configuration
curl -fsSL https://github.com/saltstack/salt-install-guide/releases/latest/download/salt.sources | sudo tee /etc/apt/sources.list.d/salt.sources

sudo apt update -y
sudo apt install -y salt-master salt-minion

ln ./../salt/master /etc/salt/master
ln ./../salt/minion /etc/salt/minion

sudo systemctl enable salt-master && sudo systemctl start salt-master
sudo systemctl enable salt-minion && sudo systemctl start salt-minion
