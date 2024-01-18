[![Datalayer](https://assets.datalayer.tech/datalayer-25.svg)](https://datalayer.io)

[![Become a Sponsor](https://img.shields.io/static/v1?label=Become%20a%20Sponsor&message=%E2%9D%A4&logo=GitHub&style=flat&color=1ABC9C)](https://github.com/sponsors/datalayer)

# Ξ Metarepo template for Datalayer

This repository serves as a [Copier](https://copier.readthedocs.io/en/stable/) template designed to generate a scaffolding project that allows to simultaneously develop on multiple repositories. This **metarepo** will, then, allow you to clone a list of independent repositories under the `package` folder and will create with [Lerna.js](https://lerna.js.org) the needed links so a change in `repository x` will be visible by `repository y`.

This is particularly useful for JavaScript and TypeScript based projects, and we use it at Datalayer to simultaneously develop on many JupyterLab extensions (mixed Typescript and Python repositories).

> [!NOTE]  
> While the current version does not include features related to `git submodule`, ongoing discussions about this enhancement can be found [here](https://github.com/datalayer/metarepo/issues/2).

## Usage

The following section provides a step-by-step guide on how to generate your scaffolding project.

### Install Copier

Ensure that Copier is correctly installed by following the instructions in the [official documentation](https://copier.readthedocs.io/en/stable/#installation).

### Generate the metarepo structure

Generate the project using the command provided below. Be sure to replace `<path/to/desired/location>` with your chosen project location.

```bash
copier copy --trust https://github.com/datalayer/metarepo.git <path/to/desired/location>
```

This command initiates a series of prompts to configure the project based on your preferences.

### Finalize

Complete the setup of your scaffolding project by referring to the instructions outlined in the README of the newly generated project.

Happy metarepo! 🚀