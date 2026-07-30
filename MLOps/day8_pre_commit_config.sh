#!/bin/bash
# ==============================================================================
# KodeKloud MLOps - Day 8
# ==============================================================================
# TASK: 
# Fix broken .pre-commit-config.yaml in /root/code/fraud-detection/.
# Declare five hooks: trailing-whitespace, end-of-file-fixer, check-yaml, 
# ruff, and black with valid rev pins. Ensure pre-commit run --all-files passes.
# ==============================================================================

# ANSWER:

cd /root/code/fraud-detection

# 1. Update .pre-commit-config.yaml with correct hook IDs, repo URLs, and initial rev tags
cat <<EOF > .pre-commit-config.yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v2.3.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml

  - repo: https://github.com/astral-sh/ruff-pre-commit
    rev: v0.16.0
    hooks:
      - id: ruff

  - repo: https://github.com/psf/black-pre-commit-mirror
    rev: 26.5.1
    hooks:
      - id: black
EOF

# 2. Install pre-commit git hooks
pre-commit install

# 3. Auto-update hook revisions to the latest versions
pre-commit autoupdate

# 4. Run pre-commit against all tracked files
pre-commit run --all-files
