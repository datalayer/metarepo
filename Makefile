# Copyright (c) Datalayer, Inc. https://datalayer.io
# Distributed under the terms of the MIT License.

SHELL=/bin/bash

MAMBA=source ~/.bash_profile
MAMBA_ACTIVATE=eval "$(micromamba shell hook --shell=bash)"; micromamba activate
MAMBA_DEACTIVATE=micromamba deactivate
MAMBA_REMOVE=micromamba remove -y --all -n

ENV_NAME=datalayer

.DEFAULT_GOAL := default

help: ## display this help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

default: help ## default target is help

env: warning ## env
	($(MAMBA); \
		micromamba env create -y -n ${ENV_NAME} -f ./environment.yml )

env-rm: warning ## env-rm
	($(MAMBA); $(MAMBA_DEACTIVATE) && \
		micromamba remove -y --name ${ENV_NAME} --all || true )
