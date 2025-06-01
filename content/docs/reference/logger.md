---
title: SLogger
linkTitle: Logger
type: docs
categories: ["reference", "core/v1"]
tags: ["SLogger"]
description: "SLogger is a logger"
weight: 10
params:
  ref: "main"
---

## Overview

`Slogger` resource is a logger resouce.
It is built on the Go's logger package [slogger](https://pkg.go.dev/log/slog).

Config yaml format becomes like below.
And the resource specific spec is defined in in the proto format shown in the [Resource Definition](#resource-definition).

```yaml
apiVersion: core/v1
kind: SLogger
metadata:
  name: "default"
  namespace: "default"
spec: {}
```

## Resource Definition

SLogger is defined in the [proto/core/v1/slogger.proto]({{% github-url "proto/core/v1/slogger.proto" %}})

```proto
{{% github-raw "proto/core/v1/slogger.proto" %}}
```
