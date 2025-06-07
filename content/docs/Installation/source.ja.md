---
title: ソースコードからインストール
linkTitle: ソースコード
type: docs
categories: ["installation"]
tags: []
description: ""
weight: 5
---

## Prerequisite

### Go

AILERON Gateway をソースコードからインストールするには、環境に Go がインストールされている必要があります。

Go のインストール方法については、[Go のダウンロードとインストール](https://go.dev/doc/install) を参照し、`go` コマンドが環境で使用可能であることを確認してください。

```sh
$ go version
go version go1.24.0 linux/amd64
```

## インストール

### 最新版をインストール

`@latest` バージョンを使用してください。  
このコマンドはソースコードをダウンロードし、ローカル環境で AILERON Gateway のバイナリをビルドします。

```bash
go install github.com/aileron-gateway/aileron-gateway/cmd/aileron@latest
```

### ブランチからインストール

`@<branch name>` バージョンを使用してください。  
このコマンドは指定したブランチのソースコードをダウンロードし、ローカル環境で AILERON Gateway のバイナリをビルドします。

なお、このコマンドはメインブランチのソースコードからインストールします。

```bash
go install github.com/aileron-gateway/aileron-gateway/cmd/aileron@main
```

### タグからインストール

`@<tag name>` バージョンを使用してください。  
このコマンドは指定したタグのソースコードをダウンロードし、ローカル環境で AILERON Gateway のバイナリをビルドします。

このコマンドは `v1.0.0` タグのソースコードからインストールします。

```bash
go install github.com/aileron-gateway/aileron-gateway/cmd/aileron@v1.0.0
```

### その他のオプション

詳しくは [go install ドキュメント](https://go.dev/ref/mod#go-install) をご覧ください。
