#!/bin/bash
# ==============================================================================
# KodeKloud DevOps - Day 3
# ==============================================================================
# TASK: 
# Following security audits, the security team has rolled out new protocols, 
# including the restriction of direct root SSH login.
# Disable direct SSH root login on all app servers within the Stratos Datacenter.
# ==============================================================================

# ANSWER:
# Note: You must SSH into EACH app server (stapp01, stapp02, stapp03) to do this.
# Example for app server 1: ssh tony@stapp01

# 1. Open the SSH daemon configuration file (e.g. with nano or vi)
# sudo nano /etc/ssh/sshd_config
# Change: PermitRootLogin yes -> PermitRootLogin no

# (Alternatively, you can automate this with sed)
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config

# 2. Restart the SSH service to apply changes
sudo systemctl restart sshd

# 3. Verification:
# sudo tail /etc/ssh/sshd_config
