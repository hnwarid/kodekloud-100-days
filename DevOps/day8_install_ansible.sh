#!/bin/bash
# ==============================================================================
# KodeKloud DevOps - Day 8
# ==============================================================================
# TASK: 
# Install ansible version 4.8.0 on Jump host using pip3 globally so that 
# all users on the system can run ansible commands.
# ==============================================================================

# ANSWER:

# 1. Install ansible globally using pip3 with sudo
sudo pip3 install ansible==4.8.0

# 2. Verify installation location and version
which ansible
# Output: /usr/local/bin/ansible

ansible --version
# Output: ansible [core 2.11.12]

# 3. Test running ansible as another user to ensure global availability
su - thor -c "ansible --version"
