#!/bin/bash
# ==============================================================================
# KodeKloud MLOps - Day 1
# ==============================================================================
# TASK:
# The xFusionCorp Industries data science team requires a standardized Python 
# environment for their new machine learning project. Set up a virtual environment 
# on the controlplane host that includes all necessary ML libraries.
# 
# The work is done on the controlplane host under /root/code/.
# The end state must satisfy the following:
# - a Python virtual environment named ml-env exists under /root/code/
# - the environment has numpy, pandas, scikit-learn, and matplotlib installed
# - a requirements.txt capturing the installed packages is saved at 
#   /root/code/requirements.txt.
# ==============================================================================

# ANSWER:
cd /root/code/
python3 -m venv ml-env
source ml-env/bin/activate
pip install numpy pandas scikit-learn matplotlib
pip freeze > /root/code/requirements.txt


