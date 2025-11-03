#!/bin/bash

# Installation Script

## Importing Variables

ENV_PATH="./.env"

if [ -f "${ENV_PATH}" ]; then
	while IFS= read -r line || [ -n "${line}" ]; do
		# Ignore lines starting with # and empty lines
		if [ -n "$(echo "${line}" | grep -v '^\s*#')" ] && [ -n "$(echo "${line}" | grep '=')" ]; then
			# Split the value into the two pairs, delimited by the equals sign (=).
			key=$(echo "${line}" | cut -d= -f1)
			value=$(echo "$line" | cut -d= -f2-)
			# Trim leading/trailing whitespace and quotations from the value
			value=$(echo "${value}" | sed -e 's/^[[:space:]"]*//' -e 's/[[:space:]"]*$//')
			export "${key}=${value}"
		fi
	done < "${ENV_PATH}"
else
	echo 'INSTALLATION CANCELLED.'
	echo 'No .env file found. Get the example from: https://github.com/jadinheaston/Linux-Configuration/blob/main/.env.example';
	exit 1
fi

## Command Aliases

touch ~/.bash_aliases;

## Adding repositories

sudo add-apt-repository -y multiverse;

## Performing initial update

sudo apt update
sudo apt upgrade -y # Updating apt

## Software

### General

#### dconf Customization

if [ "${DCONF_EDIT}" = "true" ]; then
	sh ./microscripts/dconf.sh
fi

#### KeePassXC

if [ "${INSTALL_KEEPASSXC}" = "true" ]; then
	sh ./microscripts/keepassxc.sh
fi


sh ./microscripts/salt_install.sh

## Final updating to ensure verything is up-to-date.
sudo apt update
sudo apt upgrade -y
sudo apt auto-remove -y
