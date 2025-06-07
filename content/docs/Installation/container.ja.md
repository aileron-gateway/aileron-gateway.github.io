---
title: コンテナをインストール
linkTitle: コンテナ
type: docs
categories: ["installation"]
tags: []
description: ""
weight: 20
---

## タグ

Dockerイメージは [GitHub Container Registry](https://github.com/orgs/aileron-gateway/packages?repo_name=aileron-gateway) で公開されています。

以下のタグが利用可能です。

| Tag                                         | Base image                             |
| :------------------------------------------ | :------------------------------------- |
| `latest`, `${VERSION}`                      | gcr.io/distroless/static:latest        |
| `nonroot`, `${VERSION}-nonroot`             | gcr.io/distroless/static:nonroot       |
| `debug`, `${VERSION}-debug`                 | gcr.io/distroless/static:debug         |
| `debug-nonroot`, `${VERSION}-debug-nonroot` | gcr.io/distroless/static:debug-nonroot |

## プル

以下のコマンドでDockerイメージをプルしてください。

```bash
VERSION=v1.0.0
docker pull ghcr.io/aileron-gateway/aileron-gateway/aileron:${TAG}$-debug
```

設定ファイルを指定せずにコンテナを実行した場合、以下のようなヘルプメッセージが表示されます。

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
