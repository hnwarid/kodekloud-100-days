#!/bin/bash
# ==============================================================================
# KodeKloud MLOps - Day 3
# ==============================================================================
# TASK: 
# A teammate has submitted a requirements.in specification that does not adhere 
# to the team's standards. Correct the specification and compile it into a pinned 
# lockfile.
# ==============================================================================

# ANSWER:

cd /root/code/fraud-detection

# 1. Update requirements.in with exact top-level packages required
cat <<EOF > requirements.in
scikit-learn
mlflow
pandas
numpy
EOF

# 2. Use uv to compile the lockfile, which resolves dependencies and pins versions
uv pip compile requirements.in -o requirements.txt
