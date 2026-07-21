#!/bin/bash
# ==============================================================================
# KodeKloud DevOps - Day 4
# ==============================================================================
# TASK: 
# Grant executable permissions to the /tmp/xfusioncorp.sh script on App Server 2. 
# Ensure that all users have the capability to execute it.
# ==============================================================================

# ANSWER:
# Note: You must first SSH into App Server 2
# ssh steve@stapp02

# 1. Grant read and execute permissions to all users (a+rx)
sudo chmod a+rx /tmp/xfusioncorp.sh

# 2. Verify the script runs
/tmp/xfusioncorp.sh
