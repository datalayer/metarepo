[![Datalayer](https://assets.datalayer.tech/datalayer-25.svg)](https://datalayer.io)

[![Become a Sponsor](https://img.shields.io/static/v1?label=Become%20a%20Sponsor&message=%E2%9D%A4&logo=GitHub&style=flat&color=1ABC9C)](https://github.com/sponsors/datalayer)

# Ξ Metarepo for Datalayer

This **metarepo** serves as a foundational framework facilitating the simultaneous development across multiple repositories. By cloning independent repositories into the `package` folder and utilizing [Lerna.js](https://lerna.js.org), it establishes the necessary inter-repository links. This ensures that a modification in one repository, such as `repository x`, becomes immediately visible in `repository y`.

## Key Features
- **Efficient Collaboration**: Ideal for JavaScript and TypeScript projects, particularly tailored for Datalayer's simultaneous development of various JupyterLab extensions (comprising both TypeScript and Python repositories).

- **Customizable Environment**: Easily adaptable to different project requirements, with the option to incorporate patches as needed for `node_modules` packages.

> [!NOTE]  
> While the current version does not include features related to `git submodule`, ongoing discussions about this enhancement can be found [here](https://github.com/datalayer/metarepo/issues/2).

## Usage

The primary usage at Datalayer being JupyterLab development, we rely on [Yarn 3](https://yarnpkg.com) and Python. To start setting up your environment follow the instructions hereunder.

### Set Working Directory

Ensure that you are in the metarepo's working directory

### Create the environment

To create your environment, you will need [MiniConda](https://docs.conda.io/en/latest/miniconda.html):

```bash
# Create and activate the conda environment.
conda env create -n datalayer -f ./environment.yml
conda activate datalayer
```

Alternatively, you can use [MicroMamba](https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html):

```bash
# Create and activate the mamba environment.
micromamba env create -y -n datalayer -f ./environment.yml
micromamba activate datalayer
```

### [Optional] Add pacthes
Review the `patches` folder and put there any patch you would need for the `node_modules` packages.

### Build the metarepo

To clone the listed repositories, install dependencies, and build the metarepo, use:
```bash
make
```

OR execute the following commands yourself:

```bash
./metarepo clone
yarn
yarn build
```

> [!WARNING]  
> In some cases, Yarn does not seem to manage correctly the dependencies between projects. You will, therefore, have to run `yarn build` multiple times, or build manually, in the right order, each repository from the `packages` subfolder.

For continuous development, use `yarn watch`, serving as an alias for `lerna watch` as defined in `package.json`.

> [!NOTE]  
> Feel free to incorporate additional commands in the root `package.json` as per your project requirements.

Happy metarepo! 🚀