#!/bin/bash
# ==============================================================================
# KodeKloud DevOps - Day 9
# ==============================================================================
# TASK: 
# Troubleshoot and fix MariaDB service failing to start on Database Server (stdb01).
# ==============================================================================

# ANSWER:

# 1. SSH to Database Server
# ssh peter@stdb01

# 2. Inspect failing service status & logs
# systemctl status mariadb
# Log error indicated: /var/lib/mysql is missing or datadir mismatched

# 3. Locate actual data directory and mariadb configuration
# grep -rn "datadir" /etc/my.cnf.d/
# Config showed datadir=/var/lib/mysql, but directory on disk was /var/lib/mysqld

# 4. Rename directory to match config datadir and fix permissions
sudo mv /var/lib/mysqld /var/lib/mysql
sudo chown -R mysql:mysql /var/lib/mysql

# 5. Start and enable MariaDB service
sudo systemctl start mariadb
sudo systemctl enable mariadb

# 6. Verify service status
systemctl status mariadb
# Output: Active: active (running)
