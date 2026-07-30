#!/bin/bash
# ==============================================================================
# KodeKloud MLOps - Day 9
# ==============================================================================
# TASK: 
# Fix broken Cookiecutter template at /root/code/mlops-template/ and generate a 
# new project churn-model with project_name=churn-model and ml_framework=sklearn.
# ==============================================================================

# ANSWER:

cd /root/code/mlops-template/

# 1. Update cookiecutter.json to include ml_framework choices
cat <<EOF > cookiecutter.json
{
    "project_name": "my-ml-project",
    "author": "xFusionCorp",
    "python_version": "3.11",
    "ml_framework": ["sklearn", "pytorch", "tensorflow"]
}
EOF

# 2. Fix variable casing in README.md template (Author -> author)
cat <<EOF > {{cookiecutter.project_name}}/README.md
# {{cookiecutter.project_name}}

Created by {{ cookiecutter.author }}.
EOF

# 3. Fix syntax error in requirements.txt template (= -> == in Jinja2 conditionals)
cat <<EOF > {{cookiecutter.project_name}}/requirements.txt
{% if cookiecutter.ml_framework == 'sklearn' %}
scikit-learn
{% elif cookiecutter.ml_framework == 'pytorch' %}
torch
{% elif cookiecutter.ml_framework == 'tensorflow' %}
tensorflow
{% endif %}
EOF

# 4. Generate new project from root code directory
cd /root/code
cookiecutter /root/code/mlops-template/ --no-input \
    project_name="churn-model" \
    author="xFusionCorp" \
    python_version="3.11" \
    ml_framework="sklearn"

# 5. Verify generated project
cat /root/code/churn-model/README.md
cat /root/code/churn-model/requirements.txt
