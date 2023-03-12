#!/bin/bash

# Restore environment variables to original definitions

# Restore PYTHONPATH
export PYTHONPATH="${PYTHONPATH_BAK}"

# Undefine intermediate *_BAK environment variables

# Undefine intermediate PYTHONPATH_BAK
unset PYTHONPATH_BAK
