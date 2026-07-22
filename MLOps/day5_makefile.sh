#!/bin/bash
# ==============================================================================
# KodeKloud MLOps - Day 5
# ==============================================================================
# TASK: 
# Ensure that the Makefile is aligned with the team's standards:
# - setup, data, train, test, clean, all targets
# - all six target names declared as .PHONY
# - Makefile recipes indented with a real tab character
# ==============================================================================

# ANSWER:

cd fraud-detection

cat Makefile
# Output showed initial Makefile with spaces

make all
# Output: Makefile:7: *** missing separator.  Stop.

# replace four spaces with tab
sed -i 's/^    /\t/' Makefile

# I edited the file manually here to fix .PHONY, clean, and all targets.

cat Makefile
# Output:
# # fraud-detection Makefile
# .PHONY: setup data train test clean all
# setup:
# 	python3 -m venv mlops-venv && mlops-venv/bin/pip install -r requirements.txt
# 
# data:
# 	python3 src/data/process_data.py
# 
# train:
# 	python3 src/models/train.py
# 
# test:
# 	pytest tests/
# 
# clean:
# 	find . -type d -name "__pycache__" -exec rm -rf {} +
# 	rm -rf .pytest_cache
# 	rm -rf models/*
# 
# all: setup data train test

make all
# Output:
# python3 -m venv mlops-venv && mlops-venv/bin/pip install -r requirements.txt
# Collecting scikit-learn (from -r requirements.txt (line 1))
# ...
# python3 src/data/process_data.py
# python3 src/models/train.py
# pytest tests/
# ============================= test session starts =============================
# platform linux -- Python 3.12.3, pytest-9.1.1, pluggy-1.6.0
# rootdir: /root/code/fraud-detection
# plugins: hydra-core-1.3.4, typeguard-4.5.2, testinfra-10.2.2, Faker-40.28.1, anyio-4.14.1
# collected 1 item                                                              
#
# tests/test_smoke.py .                                                   [100%]
#
# ============================== 1 passed in 0.05s ==============================

history
