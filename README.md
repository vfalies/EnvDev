# EnvDev

## Environment composition

This environment provies the following tools to develop in PHP / JS :

## Requirements

Two system dependencies are required :

- Docker
- Docker Compose

## Installation

```shell
git clone git@github.com:vfalies/EnvDev.git
```

Create a new profile to define your configuration.

```shell
make profile
```

## Documentation

All documentation is available in [docs directory](./docs)

## Troubleshooting

- 3.0 version of EnvDev, store configuration in `profiles` directory.

- 2.4 & 2.5 version of EnvDev, has add new environment constants in `.env` file. If you use an older version, this file must be update with all constants presents in `.env.dist`.

## Open source

EnvDev is licensed under the MIT License and published through [GitHub](https://github.com/vfalies/envdev/blob/master/LICENSE)
