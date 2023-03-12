# CondaEnvironmentTemplate

Template starting point for developing a new Conda environment definition compatible with CondaEnvironmentManager.

## Introduction

Conda environment definitions can be tracked and managed as separate git repositories and added to this folder as submodules. This way new project environments can be constructed from the reuse and composition of existing environments. Through iteration on shared environments, this feature enables the development of quality of life improvements on multiple projects simultaneously.

## Structure

A typical Conda environment definition will have the following structure:

- Environment.yml  
- Scripts/  
  - Ash/  
    - Load_Environment_Variables.sh  
    - Unload_Environment_Variables.sh  
  - Bash/  
    - Load_Environment_Variables.sh  
    - Unload_Environment_Variables.sh

### Environment

The `Environment.yml` file contains all the content typically generated from a `conda export` command.

### Ash and Bash

`Bash` is the more-commonly-used and more-powerful shell.  A separate version of scripts written for the `Ash` shell is included to support `Alpine-Linux` containers out-of-the-box (without requiring a `Bash` install).

### Load and Unload

Common requirements when activating a Conda environment involve setting environment variables and performing other actions. Similarly deactivating a Conda environment may require some additional cleanup work.  The Conda Environment Manager's `Import_Conda_Environment` script automatically creates the related `env_vars.sh` scripts in the new environment's `etc/conda/activate.d` and `etc/conda/deactivate.d` subfolders to call the `Load_Environment_Variables` and `Unload_Environment_Variables` scripts as appropriate.  This provides support for setting complex variables, sourcing other scripts, etc. in a manner that may be version-controlled and shared.

_NOTE: Created environments are target-specific and as such not ideal for sharing. Environment definitions as supported here are designed to offer that cross-system compatibility._

## Usage

This project template is designed explicitly for compatibility with the [CondaEnvironmentManager](https://github.com/chaoscommencer/CondaEnvironmentManager). Forks of this template should be cloned into the `Environments/Definitions` subdirectory of a CondaEnvironmentManager instance as submodules via the following command:

```bash
git submodule add -b <branch_name> <fork_repository_url> Environments/Definitions/<fork_repository_name>
```

After cloning the project containing the CondaEnvironmentManager instance for the first time, be sure to invoke the following command to pull down all environment definition submodules:

```bash
git submodule update --init --recursive
```
