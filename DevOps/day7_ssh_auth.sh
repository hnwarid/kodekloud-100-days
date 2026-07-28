#!/bin/bash
# ==============================================================================
# KodeKloud DevOps - Day 7
# ==============================================================================
# TASK: 
# Set up password-less SSH authentication from user thor on jump host to all 
# app servers (stapp01, stapp02, stapp03) through their respective sudo users:
# - tony@stapp01
# - steve@stapp02
# - banner@stapp03
# ==============================================================================

# ANSWER:

# 1. Generate SSH key pair on jump host (if not already created)
if [ ! -f ~/.ssh/id_ed25519 ]; then
    ssh-keygen -t ed25519 -N "" -f ~/.ssh/id_ed25519
fi

# 2. Copy public key to all app servers
ssh-copy-id tony@stapp01
ssh-copy-id steve@stapp02
ssh-copy-id banner@stapp03

# 3. Verification: verify passwordless SSH access
ssh tony@stapp01 "whoami; hostname"
ssh steve@stapp02 "whoami; hostname"
ssh banner@stapp03 "whoami; hostname"
