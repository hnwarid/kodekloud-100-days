#!/bin/bash
# ==============================================================================
# KodeKloud DevOps - Day 1
# ==============================================================================
# TASK:
# To accommodate the backup agent tool's specifications, the system admin team at 
# xFusionCorp Industries requires the creation of a user with a non-interactive shell.
# Create a user named anita with a non-interactive shell on App Server 2.
# ==============================================================================

# ANSWER:
# Note: You must first SSH into App Server 2 (e.g., stapp02) before running this.
# Example: ssh steve@stapp02

# Create the user with a non-interactive shell (/sbin/nologin)
sudo useradd -s /sbin/nologin anita

# Verification step (optional)
# grep anita /etc/passwd


