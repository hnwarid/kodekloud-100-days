#!/bin/bash
# ==============================================================================
# KodeKloud DevOps - Day 6
# ==============================================================================
# TASK: 
# a. Install cronie package on all Nautilus app servers (stapp01, stapp02, stapp03)
#    and start crond service.
# b. Add a cron */5 * * * * echo hello > /tmp/cron_text for root user.
# ==============================================================================

# ANSWER:

# Repeat the following steps on all three app servers:
# App Server 1: ssh tony@stapp01
# App Server 2: ssh steve@stapp02
# App Server 3: ssh banner@stapp03

# 1. Install cronie package
sudo yum install -y cronie

# 2. Start and enable crond service
sudo systemctl start crond
sudo systemctl enable crond

# 3. Add the cron job for root user
echo "*/5 * * * * echo hello > /tmp/cron_text" | sudo crontab -u root -

# 4. Verify crontab entry and service status
sudo crontab -u root -l
sudo systemctl status crond
