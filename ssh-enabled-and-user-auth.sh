#!/bin/bash
set -e  # Exit on any error

# Prompt for a new password for the bitnami user
echo "Please enter a new password for the bitnami user:"
read -s password

# Set the password for the ubuntu user
echo -e "$password\n$password" | sudo passwd ubuntu

# Enable password authentication in sshd_config
sudo sed -i.bak 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Restart SSH service to apply changes
sudo systemctl restart sshd

echo "Password successfully set for the bitnami user and password authentication enabled."

# Log the actions performed
echo "$(date) - Password set for bitnami user. Password authentication enabled." >> script_log.txt
