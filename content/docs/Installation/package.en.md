---
title: Install with Linux Package
linkTitle: Linux Package
type: docs
categories: ["installation"]
tags: []
description: ""
weight: 15
---

## Prerequisite

AILERON Gateway currently distributes linux packages for following environment.
Make sure your environment are listed in the tale.

Notes: `amd64=x86_64`, `386=x86`, `arm7=arm/v7`

|                     | amd64 | 386 | arm64 | arm7 | ppc64le | riscv64 | s390x |
| :------------------ | :---: | :-: | :---: | :--: | :-----: | :-----: | :---: |
| .rpm                |  ✅   | ❌  |  ✅   |  ❌  |   ❌    |   ✅    |  ❌   |
| .deb (Debian)       |  ✅   | ❌  |  ✅   |  ❌  |   ❌    |   ✅    |  ❌   |
| .apk (Alpine)       |  ✅   | ❌  |  ✅   |  ❌  |   ❌    |   ✅    |  ❌   |
| .pkg.tar.zst (Arch) |  ✅   | ❌  |  ✅   |  ❌  |   ❌    |   ✅    |  ❌   |

{{% alert title="Warning" color="warning" %}}
Names of the CPU architectures are different depending on each linux distribution communities.
AILERON Gateway packages uses their community naming convention.
{{% /alert %}}

## Install

### Install with apt

Visit [releases](https://github.com/aileron-gateway/aileron-gateway/releases) and download `aileron_${VERSION}-1_${ARCH}.deb`.

Example:

```bash
ARCH=amd64
VERSION=v1.0.0
curl -OL https://github.com/aileron-gateway/aileron-gateway/releases/download/${VERSION}/aileron_${VERSION}-1_${ARCH}.deb
```

**Install:**

```bash
ARCH=amd64
VERSION=v1.0.0
sudo apt install ./aileron_${VERSION}-1_${ARCH}.deb
```

Resources are installed with this structure.
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

**Uninstall:**

```bash
sudo apt remove --purge aileron
```

### Install with dpkg

Visit [releases](https://github.com/aileron-gateway/aileron-gateway/releases) and download `aileron_${VERSION}-1_${ARCH}.deb`.

Example:

```bash
ARCH=amd64
VERSION=v1.0.0
curl -OL https://github.com/aileron-gateway/aileron-gateway/releases/download/${VERSION}/aileron_${VERSION}-1_${ARCH}.deb
```

**Install:**

```bash
ARCH=amd64
VERSION=v1.0.0
sudo dpkg --install ./aileron_${VERSION}-1_${ARCH}.deb
```

Resources are installed with this structure.
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

**Uninstall:**

```bash
sudo dpkg --purge aileron
```

### Install with rpm

Visit [releases](https://github.com/aileron-gateway/aileron-gateway/releases) and download `aileron-${VERSION}-1.${ARCH}.rpm`.

Example:

```bash
ARCH=x86_64
VERSION=v1.0.0
curl -OL https://github.com/aileron-gateway/aileron-gateway/releases/download/${VERSION}/aileron-${VERSION}-1.${ARCH}.rpm
```

**Install:**

```bash
ARCH=x86_64
VERSION=v1.0.0
sudo rpm --install ./aileron-${VERSION}-1.${ARCH}.rpm
```

Resources are installed with this structure.
See also [aileron-gateway/packaging/rpm/](https://github.com/aileron-gateway/aileron-gateway/tree/main/packaging/rpm)

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

**Uninstall:**

```bash
sudo rpm --erase aileron
```

### Install with yum

Visit [releases](https://github.com/aileron-gateway/aileron-gateway/releases) and download `aileron-${VERSION}-1.${ARCH}.rpm`.

Example:

```bash
ARCH=x86_64
VERSION=v1.0.0
curl -OL https://github.com/aileron-gateway/aileron-gateway/releases/download/${VERSION}/aileron-${VERSION}-1.${ARCH}.rpm
```

**Install:**

```bash
ARCH=x86_64
VERSION=v1.0.0
sudo yum install ./aileron-${VERSION}-1.${ARCH}.rpm
```

Resources are installed with this structure.
See also [aileron-gateway/packaging/rpm/](https://github.com/aileron-gateway/aileron-gateway/tree/main/packaging/rpm)

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

**Uninstall:**

```bash
sudo yum remove aileron
```

### Install with dnf

Visit [releases](https://github.com/aileron-gateway/aileron-gateway/releases) and download `aileron-${VERSION}-1.${ARCH}.rpm`.

Example:

```bash
ARCH=x86_64
VERSION=v1.0.0
curl -OL https://github.com/aileron-gateway/aileron-gateway/releases/download/${VERSION}/aileron-${VERSION}-1.${ARCH}.rpm
```

**Install:**

```bash
ARCH=x86_64
VERSION=v1.0.0
sudo dnf install ./aileron-${VERSION}-1.${ARCH}.rpm
```

Resources are installed with this structure.
See also [aileron-gateway/packaging/rpm/](https://github.com/aileron-gateway/aileron-gateway/tree/main/packaging/rpm)

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

**Uninstall:**

```bash
sudo dnf erase aileron
```

### Install with apk

Visit [releases](https://github.com/aileron-gateway/aileron-gateway/releases) and download `aileron_${VERSION}-r1_${ARCH}.apk`.

Example:

```bash
ARCH=x86_64
VERSION=v1.0.0
wget https://github.com/aileron-gateway/aileron-gateway/releases/download/${VERSION}/aileron_${VERSION}-r1_${ARCH}.apk
```

**Install:**

```bash
ARCH=x86_64
VERSION=v1.0.0
apk add --allow-untrusted ./aileron_${VERSION}-r1_${ARCH}.apk
```

Resources are installed with this structure.
See also [aileron-gateway/packaging/apk/](https://github.com/aileron-gateway/aileron-gateway/tree/main/packaging/apk)

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

**Uninstall:**

```bash
apk del --purge aileron
```
