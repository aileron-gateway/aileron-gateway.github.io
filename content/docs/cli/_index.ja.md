---
title: CLIの使いかた
linkTitle: CLIの使いかた
type: docs
categories: []
tags: []
description: "CLI usage"
weight: 30
---

## オプション

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

## `-t`、`--template` オプションの使い方

Kubernetes の CLI である [kubectl](https://kubernetes.io/docs/reference/kubectl/) のように、  
AILERON Gatewayでも設定ファイルのテンプレートを表示できます。  
出力されるテンプレートはそのまま使えるわけではありません。  
プロジェクトに応じて修正して利用してください。

以下は HTTPServer のテンプレートを表示する例です。

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

CLIはAILERON Gateway内部で実際に使用される設定を出力できます。

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
