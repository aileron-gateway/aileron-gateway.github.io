---
title: Linuxパッケージをインストール
linkTitle: Linuxパッケージ
type: docs
categories: ["installation"]
tags: []
description: ""
weight: 15
---

## 前提条件

AILERON Gateway は現在、以下の環境向けに Linux パッケージを配布しています。  
ご利用の環境が下表に含まれていることをご確認ください。

※ 注: `amd64 = x86_64`, `386 = x86`, `arm7 = arm/v7`

|                     | amd64 | 386 | arm64 | arm7 | ppc64le | riscv64 | s390x |
| :------------------ | :---: | :-: | :---: | :--: | :-----: | :-----: | :---: |
| .rpm                |  ✅   | ❌  |  ✅   |  ❌  |   ❌    |   ✅    |  ❌   |
| .deb (Debian)       |  ✅   | ❌  |  ✅   |  ❌  |   ❌    |   ✅    |  ❌   |
| .apk (Alpine)       |  ✅   | ❌  |  ✅   |  ❌  |   ❌    |   ✅    |  ❌   |
| .pkg.tar.zst (Arch) |  ✅   | ❌  |  ✅   |  ❌  |   ❌    |   ✅    |  ❌   |

{{% alert title="Warning" color="warning" %}}
CPU アーキテクチャの名称は、各 Linux ディストリビューションのコミュニティによって異なります。  
AILERON Gateway のパッケージは、それぞれのコミュニティの命名規則に従っています。
{{% /alert %}}

## インストール

### apt を使ったインストール

[リリースページ](https://github.com/aileron-gateway/aileron-gateway/releases)を開き、`aileron_${VERSION}-1_${ARCH}.deb` をダウンロードしてください。

例：

```bash
ARCH=amd64
VERSION=v1.0.0
curl -OL https://github.com/aileron-gateway/aileron-gateway/releases/download/${VERSION}/aileron_${VERSION}-1_${ARCH}.deb
```

**インストール：**

```bash
ARCH=amd64
VERSION=v1.0.0
sudo apt install ./aileron_${VERSION}-1_${ARCH}.deb
```

Resou リソースは以下の構造でインストールされます。
See also [aileron-gateway/packaging/deb/](https://github.com/aileron-gateway/aileron-gateway/tree/main/packaging/deb)

```txt
/
├── etc/
│   ├── default/
│   │   └── aileron.env
│   └── aileron/
│       └── config.yaml
├── usr/
│   ├── bin/
│   │   └── aileron
│   └── lib/
│       └── systemd/
│           └── system/
│               └── aileron.service
└── var/
    └── lib/
        └── aileron/
```

**アンインストール：**

```bash
sudo apt remove --purge aileron
```

### dpkg を使ったインストール

[リリースページ](https://github.com/aileron-gateway/aileron-gateway/releases)を開き、`aileron_${VERSION}-1_${ARCH}.deb` をダウンロードしてください。

例：

```bash
ARCH=amd64
VERSION=v1.0.0
curl -OL https://github.com/aileron-gateway/aileron-gateway/releases/download/${VERSION}/aileron_${VERSION}-1_${ARCH}.deb
```

**インストール：**

```bash
ARCH=amd64
VERSION=v1.0.0
sudo dpkg --install ./aileron_${VERSION}-1_${ARCH}.deb
```

リソースは以下の構造でインストールされます。  
詳細は [aileron-gateway/packaging/deb/](https://github.com/aileron-gateway/aileron-gateway/tree/main/packaging/deb) もご覧ください。

```txt
/
├── etc/
│   ├── default/
│   │   └── aileron.env
│   └── aileron/
│       └── config.yaml
├── usr/
│   ├── bin/
│   │   └── aileron
│   └── lib/
│       └── systemd/
│           └── system/
│               └── aileron.service
└── var/
    └── lib/
        └── aileron/
```

**アンインストール：**

```bash
sudo dpkg --purge aileron
```

### rpm を使ったインストール

[リリースページ](https://github.com/aileron-gateway/aileron-gateway/releases)を開き、`aileron-${VERSION}-1.${ARCH}.rpm` をダウンロードしてください。

例：

```bash
ARCH=x86_64
VERSION=v1.0.0
curl -OL https://github.com/aileron-gateway/aileron-gateway/releases/download/${VERSION}/aileron-${VERSION}-1.${ARCH}.rpm
```

**インストール：**

```bash
ARCH=x86_64
VERSION=v1.0.0
sudo rpm --install ./aileron-${VERSION}-1.${ARCH}.rpm
```

リソースは以下の構造でインストールされます。  
詳細は [aileron-gateway/packaging/rpm/](https://github.com/aileron-gateway/aileron-gateway/tree/main/packaging/rpm) もご参照ください。

```txt
/
├── etc/
│   ├── sysconfig/
│   │   └── aileron.env
│   └── aileron/
│       └── config.yaml
├── usr/
│   ├── bin/
│   │   └── aileron
│   └── lib/
│       └── systemd/
│           └── system/
│               └── aileron.service
└── var/
    └── lib/
        └── aileron/
```

**アンインストール：**

```bash
sudo rpm --erase aileron
```

### yum を使ったインストール

[リリースページ](https://github.com/aileron-gateway/aileron-gateway/releases)を開き、`aileron-${VERSION}-1.${ARCH}.rpm` をダウンロードしてください。

例：

```bash
ARCH=x86_64
VERSION=v1.0.0
curl -OL https://github.com/aileron-gateway/aileron-gateway/releases/download/${VERSION}/aileron-${VERSION}-1.${ARCH}.rpm
```

**インストール：**

```bash
ARCH=x86_64
VERSION=v1.0.0
sudo yum install ./aileron-${VERSION}-1.${ARCH}.rpm
```

リソースは以下の構造でインストールされます。  
詳細は [aileron-gateway/packaging/rpm/](https://github.com/aileron-gateway/aileron-gateway/tree/main/packaging/rpm) もご覧ください。

```txt
/
├── etc/
│   ├── sysconfig/
│   │   └── aileron.env
│   └── aileron/
│       └── config.yaml
├── usr/
│   ├── bin/
│   │   └── aileron
│   └── lib/
│       └── systemd/
│           └── system/
│               └── aileron.service
└── var/
    └── lib/
        └── aileron/
```

**アンインストール：**

```bash
sudo yum remove aileron
```

### dnf を使ったインストール

[リリースページ](https://github.com/aileron-gateway/aileron-gateway/releases)を開き、`aileron-${VERSION}-1.${ARCH}.rpm` をダウンロードしてください。

例：

```bash
ARCH=x86_64
VERSION=v1.0.0
curl -OL https://github.com/aileron-gateway/aileron-gateway/releases/download/${VERSION}/aileron-${VERSION}-1.${ARCH}.rpm
```

**インストール：**

```bash
ARCH=x86_64
VERSION=v1.0.0
sudo dnf install ./aileron-${VERSION}-1.${ARCH}.rpm
```

リソースは以下の構造でインストールされます。  
詳細は [aileron-gateway/packaging/rpm/](https://github.com/aileron-gateway/aileron-gateway/tree/main/packaging/rpm) もご参照ください。

```txt
/
├── etc/
│   ├── sysconfig/
│   │   └── aileron.env
│   └── aileron/
│       └── config.yaml
├── usr/
│   ├── bin/
│   │   └── aileron
│   └── lib/
│       └── systemd/
│           └── system/
│               └── aileron.service
└── var/
    └── lib/
        └── aileron/
```

**アンインストール：**

```bash
sudo dnf erase aileron
```

### apk を使ったインストール

[リリースページ](https://github.com/aileron-gateway/aileron-gateway/releases)を開き、`aileron_${VERSION}-r1_${ARCH}.apk` をダウンロードしてください。

例：

```bash
ARCH=x86_64
VERSION=v1.0.0
wget https://github.com/aileron-gateway/aileron-gateway/releases/download/${VERSION}/aileron_${VERSION}-r1_${ARCH}.apk
```

**インストール：**

```bash
ARCH=x86_64
VERSION=v1.0.0
apk add --allow-untrusted ./aileron_${VERSION}-r1_${ARCH}.apk
```

リソースは以下の構造でインストールされます。  
詳細は [aileron-gateway/packaging/apk/](https://github.com/aileron-gateway/aileron-gateway/tree/main/packaging/apk) もご参照ください。

```txt
/
├── etc/
│   ├── init.d/
│   │   └── aileron
│   ├── default/
│   │   └── aileron.env
│   └── aileron/
│       └── config.yaml
├── usr/
│   └── bin/
│       └── aileron
└── var/
    └── lib/
        └── aileron/
```

**アンインストール：**

```bash
apk del --purge aileron
```
