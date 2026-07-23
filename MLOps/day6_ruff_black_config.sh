#!/bin/bash
# ==============================================================================
# KodeKloud MLOps - Day 6
# ==============================================================================
# TASK: 
# The fraud-detection repository is failing ruff and black checks.
# Update pyproject.toml and fix code quality issues under src/:
# - Both ruff and black configured with a line length of 120
# - ruff lint rule selection includes E, F, W, and I (under [tool.ruff.lint])
# - ruff check src/ and black --check src/ exit with status 0
# ==============================================================================

# ANSWER:

cd /root/code/fraud-detection

# 1. Inspect initial pyproject.toml and check failures
cat pyproject.toml
black --check src/
ruff check src/

# 2. Update pyproject.toml with 120 line length and updated ruff lint settings
cat <<EOF > pyproject.toml
[project]
name = "fraud-detection"
version = "0.1.0"

[tool.ruff]
line-length = 120

[tool.ruff.lint]
select = ["E", "F", "W", "I"]

[tool.black]
line-length = 120
EOF

# 3. Reformat code with black and apply ruff fixes
black src/
ruff check --fix src/

# 4. Verification
ruff check src/
# Output: All checks passed!

black --check src/
# Output: All done! 5 files left unchanged.
