[![Datalayer](https://assets.datalayer.tech/datalayer-25.svg)](https://datalayer.io)

[![Become a Sponsor](https://img.shields.io/static/v1?label=Become%20a%20Sponsor&message=%E2%9D%A4&logo=GitHub&style=flat&color=1ABC9C)](https://github.com/sponsors/datalayer)

# Ξ Metarepo for Datalayer

This repository is a scaffolding that allows to simultaneously develop on multiple repositories. It will clone  a list of independent repositories under the `package` folder and will create with [Lerna.js](https://lerna.js.org) the needed links so a change in `repository x` will be visible by `repository y`.

This is particularly useful for JavaScript and TypeScript based projects, and we use it at Datalayer to simultaneously develop on many JupyterLab extensions (mixed Typescript and Python repositories).

For now, we don't intend to add `git submodule` related features, although this is being discussed in https://github.com/datalayer/metarepo/issues/2.

## Usage

The primary usage at Datalayer being JupyterLab development, we rely on [Yarn 3](https://yarnpkg.com) and Python. To start setting up your environment follow the instructions hereunder.

First, clone this repository.

```bash
# Clone the metarepo repository.
git clone https://github.com/datalayer/metarepo.git
cd metarepo
```

Then, create your environment. You will need [MiniConda](https://docs.conda.io/en/latest/miniconda.html)

```bash
# Create and activate the conda environment.
conda env create -n datalayer -f ./environment.yml
conda activate datalayer
```

[MicroMamba](https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html) is an alternative to Conda.

```bash
# Create and activate the mamba environment.
micromamba env create -y -n datalayer -f ./environment.yml
micromamba activate datalayer
```

After creating and activating your virtual environment, update the [metarepo](https://github.com/datalayer/metarepo/blob/main/metarepo#L10) file to list the public and private repositories you intend to work on.

```bash
# Clone the listed repositories.
./metarepo clone
```

Review the `patches` folder and put there any patch you would need for the `node_modules` packages.

Install the npm dependencies.

```bash
yarn build
```

Build.

```bash
yarn build
```

You can also watch.

```bash
yarn watch
```

Add any other command in the root `package.json`.

Happy metarepo! 🚀
