#!/bin/bash
# ==============================================================================
# KodeKloud DevOps - Day 5
# ==============================================================================
# TASK: 
# Install the required SELinux packages on App Server 1 (stapp01) and permanently 
# disable SELinux in the configuration file (/etc/selinux/config).
# ==============================================================================

# ANSWER:
# SSH into App Server 1:
# ssh tony@stapp01

# 1. Install SELinux packages
sudo yum install -y selinux-policy selinux-policy-targeted

# Output:
# Complete!

# 2. Check the initial SELinux configuration file
cat /etc/selinux/config
# Output showed: SELINUX=enforcing

# 3. Permanently disable SELinux in /etc/selinux/config
# (Edited manually via: sudo nano /etc/selinux/config or automated via sed)
sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/' /etc/selinux/config

# 4. Verify configuration and status
tail /etc/selinux/config
# Output: SELINUX=disabled

getenforce
# Output: Disabled

sestatus
# Output: SELinux status: disabled
