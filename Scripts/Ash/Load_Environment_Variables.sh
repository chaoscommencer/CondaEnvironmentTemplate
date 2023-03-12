#!/bin/ash

# Backup current environment variables to support restoration on Conda
# environment deactivation

# Backup current PYTHONPATH
export PYTHONPATH_BAK="${PYTHONPATH}"

# Define Conda-environment-specific variables

# Define PYTHONPATH to enable Python module detection
export PYTHONPATH="${CONDA_PREFIX}/python_modules"

# Enable tab command completions for Conda
eval "$(register-python-argcomplete conda)"
