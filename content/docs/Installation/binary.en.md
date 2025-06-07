---
title: Install with Pre-built Binary
linkTitle: Pre-built Binary
type: docs
categories: ["installation"]
tags: []
description: ""
weight: 10
---

## Prerequisite

AILERON Gateway currently distributes pre-build binary for following environment.
Make sure your environment is listed in the tale.

Notes: `amd64=x86_64`, `386=x86`, `arm7=arm/v7`

|                          | amd64 | 386 | arm64 | arm7 | riscv64 | ppc64 | ppc64le | s390x |
| :----------------------- | :---: | :-: | :---: | :--: | :-----: | :---: | :-----: | :---: |
| [Windows](#windows)      |  ✅   | ❌  |  ✅   |  ❌  |   ❌    |  ❌   |   ❌    |  ❌   |
| [Darwin(macos)](#darwin) |  ✅   | ❌  |  ✅   |  ❌  |   ❌    |  ❌   |   ❌    |  ❌   |
| [Linux](#linux)          |  ✅   | ❌  |  ✅   |  ❌  |   ✅    |  ❌   |   ❌    |  ❌   |
| NetBSD 　                |  ❌   | ❌  |  ❌   |  ❌  |   ❌    |  ❌   |   ❌    |  ❌   |
| FreeBSD 　               |  ❌   | ❌  |  ❌   |  ❌  |   ❌    |  ❌   |   ❌    |  ❌   |
| OpenBSD 　               |  ❌   | ❌  |  ❌   |  ❌  |   ❌    |  ❌   |   ❌    |  ❌   |

Binaries for `NetBSD`, `FreeBSD`, `OpenBSD` are not officially distributed currently.
Please build it from source code if you need it.

## Install

### Linux

Visit [releases](https://github.com/aileron-gateway/aileron-gateway/releases) and download `aileron-linux-${ARCH}`.

Or, you can use curl to download binaries.
No other tools are required because the binaries are built statically.

```bash
export ARCH=amd64
export VERSION=v1.0.0
curl -OL https://github.com/aileron-gateway/aileron-gateway/releases/download/${VERSION}/aileron-linux-${ARCH}
```

### Windows

Visit [releases](https://github.com/aileron-gateway/aileron-gateway/releases) and download `aileron-windows-${ARCH}.exe`.

Or, you can use curl to download binaries.
No other tools are required because the binaries are built statically.

```bash
set ARCH=amd64
set VERSION=v1.0.0
curl -OL https://github.com/aileron-gateway/aileron-gateway/releases/download/%VERSION%/aileron-windows-%ARCH%.exe
```

### Darwin

Visit [releases](https://github.com/aileron-gateway/aileron-gateway/releases) and download `aileron-darwin-${ARCH}`.

Or, you can use curl to download binaries.
No other tools are required because the binaries are built statically.

```bash
export ARCH=amd64
export VERSION=v1.0.0
curl -OL https://github.com/aileron-gateway/aileron-gateway/releases/download/${VERSION}/aileron-darwin-${ARCH}
```

## Validate binary

AILERON Gateway binaries are built using [SLSA Go Builder](https://github.com/slsa-framework/slsa-github-generator/tree/main/internal/builders/go) and releases binaries with their SLSA3+ provenance.
So the binaries can be verified with verification tools.

### Validate with slsa-verifier

Install [slsa-verifier](https://github.com/slsa-framework/slsa-verifier)

Example to verify binary.

```bash
slsa-verifier verify-artifact aileron-linux-amd64 \
  --provenance-path aileron-linux-amd64.intoto.jsonl \
  --source-uri github.com/aileron-gateway/aileron-gateway \
  --source-tag v1.0.0
```

Once verified, `PASSED: SLSA verification passed` message will be shown.
If verification failed, `FAILED: SLSA verification failed` message will be shown.
