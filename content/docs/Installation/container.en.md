---
title: Install with Container
linkTitle: Container
type: docs
categories: ["installation"]
tags: []
description: ""
weight: 20
---

## Tags

Docker images are available at [GitHub Container Registry](https://github.com/orgs/aileron-gateway/packages?repo_name=aileron-gateway).

Following tags are available.

| Tag                                         | Base image                             |
| :------------------------------------------ | :------------------------------------- |
| `latest`, `${VERSION}`                      | gcr.io/distroless/static:latest        |
| `nonroot`, `${VERSION}-nonroot`             | gcr.io/distroless/static:nonroot       |
| `debug`, `${VERSION}-debug`                 | gcr.io/distroless/static:debug         |
| `debug-nonroot`, `${VERSION}-debug-nonroot` | gcr.io/distroless/static:debug-nonroot |

## Pull

Pull docker images with this command.

```bash
VERSION=v1.0.0
docker pull ghcr.io/aileron-gateway/aileron-gateway/aileron:${TAG}$-debug
```

Help message will be shown if the container run without config file.

```bash
$ VERSION=v1.0.0
$ docker run --rm ghcr.io/aileron-gateway/aileron-gateway/aileron:${TAG}$-debug
Options :
  -e, --env stringArray    env file path. each line be 'KEY=VALUE'
  -f, --file stringArray   config file or directory path. absolute or relative
  -h, --help               show help message
  -i, --info               show build information
  -o, --out string         template output format. yaml or json (default "yaml")
  -t, --template string    show template config. value format be 'Group/Version/Kind(/Namespace/Name)'
  -v, --version            show version
```
