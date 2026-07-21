#!/bin/bash
# ==============================================================================
# KodeKloud MLOps - Day 4
# ==============================================================================
# TASK: 
# The fraud-detection repository was committed without a .gitignore file.
# Create a .gitignore file and appropriately stop tracking the artifacts 
# that should not be included in Git.
# ==============================================================================

# ANSWER:

cd /root/code/fraud-detection/

# 1. Create the .gitignore file
cat <<EOF > .gitignore
__pycache__/
*.pyc
venv/
.ipynb_checkpoints/
*.pkl
.env
EOF

# 2. Remove all files from Git's cache (doesn't delete them from disk)
git rm -r --cached .

# 3. Re-add everything (Git will now respect the .gitignore and skip those files)
git add .

# 4. Commit the cleanup
git commit -m "fix tracking of directories and files"
