---
title: Install from Source Code
linkTitle: Source Code
type: docs
categories: []
tags: ["installation"]
description: ""
weight: 5
---

## Prerequisite

### Go

To install the AILERON Gateway from source code, GO must be installed on your environment.

Follow the [Download and install GO](https://go.dev/doc/install) to install Go and make sure `go` command is available on your environment.

```sh
$ go version
go version go1.24.0 linux/amd64
```

## Install

### Install the latest

Use `@latest` version.
This command downloads source codes and build an AILERON Gateway binary on local environment.

```bash
go install github.com/aileron-gateway/aileron-gateway/cmd/aileron@latest
```

### Install from branch

Use `@<branch name>` version.
This command downloads source codes from the specified branch and build an AILERON Gateway binary on local environment.

This command installs from source codes in the main branch.

```bash
go install github.com/aileron-gateway/aileron-gateway/cmd/aileron@main
```

### Install from tag

Use `@<tag name>` version.
This command downloads source codes from the specified tag and build an AILERON Gateway binary on local environment.

This command installs from source codes at `v1.0.0` tag.

```bash
go install github.com/aileron-gateway/aileron-gateway/cmd/aileron@v1.0.0
```

### Other options

See [go install documentation](https://go.dev/ref/mod#go-install).
