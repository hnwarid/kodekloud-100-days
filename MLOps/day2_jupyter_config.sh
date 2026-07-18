#!/bin/bash
# ==============================================================================
# KodeKloud MLOps - Day 2
# ==============================================================================
# TASK:
# A teammate has configured a JupyterLab server... however, the server is not 
# functioning as expected. Inspect the configuration, diagnose any issues, 
# and start the server.
#
# The end state must satisfy the following:
# - the running server listens on port 8888;
# - it binds on 0.0.0.0;
# - the notebook root directory is /root/notebooks/, and that directory exists.
# - JupyterLab running, opens the notebook interface.
# ==============================================================================

# ANSWER:

# 1. Create the required notebooks directory
mkdir -p /root/notebooks/

# 2. Activate the virtual environment and install missing dependencies
source /root/code/ml-env/bin/activate
pip install notebook
deactivate

# 3. Fix the config file
cat <<EOF > /root/code/jupyter_lab_config.py
c.IdentityProvider.token = ''
c.ServerApp.disable_check_xsrf = True
c.ServerApp.root_dir = '/root/notebooks/'
c.ServerApp.port = 8888
c.ServerApp.ip = '0.0.0.0'
c.ServerApp.allow_root = True
EOF

# 4. Start Jupyter Lab (Runs in foreground; for scripts you might use &)
/root/code/ml-env/bin/jupyter lab --config /root/code/jupyter_lab_config.py

