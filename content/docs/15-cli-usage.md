---
title: CLI Usage
linkTitle: CLI Usage
identifier: CLI Usage
slug: cli-usage
type: docs
categories: ["cli"]
tags: ["cli"]
description: "CLI usage"
weight: 15
---

{{% alert title="Info" color="info" %}}
Command line options can be changed without any announce in future update.
{{% /alert %}}

## Options

```bash
$ aileron -h

Options :
  -e, --env stringArray    env file path. each line be 'KEY=VALUE'
  -f, --file stringArray   config file or directory path. absolute or relative
  -h, --help               show help message
  -i, --info               show build information
  -o, --out string         template output format. yaml or json (default "yaml")
  -t, --template string    show template config. value format be 'Group/Version/Kind(/Namespace/Name)'
  -v, --version            show version
```

## How to use `-t`, `--template` option

Like [kubectl](https://kubernetes.io/docs/reference/kubectl/), the CLI of kubernetes, AILERON Gateway can show config file template.
Note that the output template does not work as it is.
Modify it depending on your project.

This shows the HTTPServer template.

```bash
$ aileron --template core/v1/HTTPServer

apiVersion: core/v1
kind: HTTPServer
metadata:
  logger: ""
  name: default
  namespace: default
spec:
  addr: :8080
  errorHandler: null
  expvar:
    enable: false
    path: /debug/vars
  http2Config: null
  http3Config: null
  httpConfig:
    allowHTTP2: false
~~~ output omitted ~~~
```

It can output configuration that are actually used inside the AILERON Gateway.

```bash
$ aileron --file /path/to/config.yaml --template core/v1/HTTPServer/foo/bar

apiVersion: core/v1
kind: HTTPServer
metadata:
  logger: ""
  name: bar
  namespace: foo
spec:
  addr: :8080
  errorHandler: null
  expvar:
    enable: false
    path: /debug/vars
  http2Config: null
  http3Config: null
  httpConfig:
    allowHTTP2: false
~~~ output omitted ~~~
```
