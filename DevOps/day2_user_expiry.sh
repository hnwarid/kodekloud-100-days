#!/bin/bash
# ==============================================================================
# KodeKloud DevOps - Day 2
# ==============================================================================
# TASK: 
# As part of the temporary assignment to the Nautilus project, a developer named 
# jim requires access for a limited duration. 
# Create a user named jim on App Server 2 in Stratos Datacenter. Set the expiry 
# date to 2027-01-28, ensuring the user is created in lowercase.
# ==============================================================================

# ANSWER:

# 1. SSH into App Server 2
# ssh steve@stapp02

# 2. Create the user with the specified expiry date (-e), home directory (-m), and shell (-s)
sudo useradd -e 2027-01-28 -m -s /bin/bash jim

# 3. Verification steps (optional)
# Verify user creation:
# grep jim /etc/passwd

# Verify expiry date:
# sudo chage -l jim
