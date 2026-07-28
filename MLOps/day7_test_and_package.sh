#!/bin/bash
# ==============================================================================
# KodeKloud MLOps - Day 7
# ==============================================================================
# TASK: 
# Validate the fraud-detection module through unit tests and package it as 
# an installable Python wheel distribution.
# Requirements:
# 1. Unit tests in tests/test_predict.py asserting fraud (amount > 100 -> 1) 
#    and legitimate (amount <= 100 -> 0) behavior.
# 2. Update pyproject.toml with [build-system], name="fraud_detection", 
#    version="0.1.0", pythonpath=["src"], dependencies, etc.
# 3. Build compliant wheel under dist/ using python3 -m build.
# ==============================================================================

# ANSWER:

cd /root/code/fraud-detection

# 1. Update pyproject.toml with correct packaging configuration
cat <<EOF > pyproject.toml
[build-system]
requires = ["setuptools>=61.0", "wheel"]
build-backend = "setuptools.build_meta"

[project]
name = "fraud_detection"
version = "0.1.0"
description = "Fraud detection model for xFusionCorp Industries"
requires-python = ">=3.10"
dependencies = [
    "scikit-learn",
    "pandas",
    "numpy",
]

[tool.setuptools.packages.find]
where = ["src"]

[tool.pytest.ini_options]
pythonpath = ["src"]
EOF

# 2. Create unit tests under tests/test_predict.py
cat <<EOF > tests/test_predict.py
from fraud_detection import predict

def test_predict_fraudulent():
    # Pass input where amount > 100
    result = predict([[3000.0]])
    assert result == 1 or result[0] == 1

def test_predict_legitimate():
    # Pass input where amount <= 100
    result = predict([[50.0]])
    assert result == 0 or result[0] == 0
EOF

# 3. Run unit tests
pytest

# Output: 2 passed

# 4. Build python wheel package
python3 -m build

# 5. Verify built artifact under dist/
ls dist/
# Output: fraud_detection-0.1.0-py3-none-any.whl fraud_detection-0.1.0.tar.gz
