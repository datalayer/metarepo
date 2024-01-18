# Copyright (c) Datalayer, Inc. https://datalayer.io
# Distributed under the terms of the MIT License.

SHELL=/bin/bash

MAMBA=source ~/.bash_profile
# MAMBA_ACTIVATE=eval "$(micromamba shell hook --shell=bash)"; micromamba activate
MAMBA_DEACTIVATE=micromamba deactivate
# MAMBA_REMOVE=micromamba remove -y --all -n

CONDA=source ~/.bash_profile
# CONDA_ACTIVATE=source $$(conda info --base)/etc/profile.d/conda.sh ; conda activate ; conda activate
CONDA_DEACTIVATE=source $$(conda info --base)/etc/profile.d/conda.sh ; conda deactivate

ENV_NAME=datalayer

.DEFAULT_GOAL := default

help: ## Display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

default: all ## Default target is all

mamba-env: ## Create a mamba env
	@($(MAMBA); \
		micromamba env create -y -n ${ENV_NAME} -f ./environment.yml)

mamba-env-rm: ## Deactivate and remove mamba env
	@($(MAMBA); $(MAMBA_DEACTIVATE) && \
		micromamba remove -y --name ${ENV_NAME} --all || true )

conda-env: ## Create a conda env
	@($(CONDA); \
		conda env create -n ${ENV_NAME} -f ./environment.yml)

conda-env-rm: ## Deactivate and remove conda env
	@($(CONDA_DEACTIVATE); \
		conda env remove --name ${ENV_NAME}|| true )

clone: ## Clone the listed repositories
	@echo "##################################### CLONING #####################################"
	@./metarepo clone

install: ## Yarn install
	@echo "################################### YARN INSTALL ##################################"
	@yarn

build: ## Yarn build
	@echo "#################################### YARN BUILD ###################################"
	@yarn build

all: ## Clone, install and build
	@$(MAKE) clone
	@$(MAKE) install
	@$(MAKE) build