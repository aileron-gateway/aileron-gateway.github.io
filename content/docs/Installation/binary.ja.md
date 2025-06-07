---
title: ビルド済みバイナリからインストール
linkTitle: ビルド済みバイナリ
type: docs
categories: ["installation"]
tags: []
description: ""
weight: 10
---

## 前提条件

AILERON Gateway は、現在以下の環境向けにビルド済みバイナリを配布しています。  
ご利用の環境が下表に含まれていることをご確認ください。

※ 注: `amd64=x86_64`, `386=x86`, `arm7=arm/v7`

|                          | amd64 | 386 | arm64 | arm7 | riscv64 | ppc64 | ppc64le | s390x |
| :----------------------- | :---: | :-: | :---: | :--: | :-----: | :---: | :-----: | :---: |
| [Windows](#windows)      |  ✅   | ❌  |  ✅   |  ❌  |   ❌    |  ❌   |   ❌    |  ❌   |
| [Darwin(macos)](#darwin) |  ✅   | ❌  |  ✅   |  ❌  |   ❌    |  ❌   |   ❌    |  ❌   |
| [Linux](#linux)          |  ✅   | ❌  |  ✅   |  ❌  |   ✅    |  ❌   |   ❌    |  ❌   |
| NetBSD 　                |  ❌   | ❌  |  ❌   |  ❌  |   ❌    |  ❌   |   ❌    |  ❌   |
| FreeBSD 　               |  ❌   | ❌  |  ❌   |  ❌  |   ❌    |  ❌   |   ❌    |  ❌   |
| OpenBSD 　               |  ❌   | ❌  |  ❌   |  ❌  |   ❌    |  ❌   |   ❌    |  ❌   |

`NetBSD`、`FreeBSD`、`OpenBSD`向けのビルドは配布していません。
必要であればソースコードからビルドしてください。

## インストール

### Linux

[リリースページ](https://github.com/aileron-gateway/aileron-gateway/releases)を開き、`aileron-linux-${ARCH}` をダウンロードしてください。

または、`curl` を使ってバイナリをダウンロードすることもできます。
バイナリはスタティックリンクされているため、他のツールは必要ありません。

```bash
export ARCH=amd64
export VERSION=v1.0.0
curl -OL https://github.com/aileron-gateway/aileron-gateway/releases/download/${VERSION}/aileron-linux-${ARCH}
```

### Windows

[リリースページ](https://github.com/aileron-gateway/aileron-gateway/releases)を開き、`aileron-windows-${ARCH}.exe` をダウンロードしてください。

あるいは、`curl` を使ってバイナリをダウンロードすることもできます。  
バイナリはスタティックリンクされているため、他のツールは必要ありません。

```bash
set ARCH=amd64
set VERSION=v1.0.0
curl -OL https://github.com/aileron-gateway/aileron-gateway/releases/download/%VERSION%/aileron-windows-%ARCH%.exe
```

### Darwin

[リリースページ](https://github.com/aileron-gateway/aileron-gateway/releases)を開き、`aileron-darwin-${ARCH}` をダウンロードしてください。

または、`curl` を使ってバイナリをダウンロードすることもできます。  
バイナリはスタティックリンクされているため、他のツールは必要ありません。

```bash
export ARCH=amd64
export VERSION=v1.0.0
curl -OL https://github.com/aileron-gateway/aileron-gateway/releases/download/${VERSION}/aileron-darwin-${ARCH}
```

## バイナリを検証する

AILERON Gateway のバイナリは、[SLSA Go Builder](https://github.com/slsa-framework/slsa-github-generator/tree/main/internal/builders/go) を使用してビルドされており、SLSA3+ のプロビナンス（由来情報）付きでリリースされています。  
そのため、バイナリは検証ツールを用いて信頼性を確認することが可能です。

### slsa-verifier で検証する

[slsa-verifier](https://github.com/slsa-framework/slsa-verifier) をインストールしてください。

バイナリを検証する例：

```bash
slsa-verifier verify-artifact aileron-linux-amd64 \
  --provenance-path aileron-linux-amd64.intoto.jsonl \
  --source-uri github.com/aileron-gateway/aileron-gateway \
  --source-tag v1.0.0
```

検証が成功すると `PASSED: SLSA verification passed` というメッセージが表示されます。  
検証に失敗した場合は `FAILED: SLSA verification failed` というメッセージが表示されます。
