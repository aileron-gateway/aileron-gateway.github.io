---
title: StaticFileHandler
linkTitle: Static File
type: docs
categories: ["reference", "core/v1"]
tags: ["StaticFileHandler"]
description: ""
weight: 20
params:
  ref: "main"
---

## Overview

StaticFileHandler servers static file.

Config yaml format becomes like below.
And the resource specific spec is defined in in the proto format shown in the [Resource Definition](#resource-definition).

```yaml
apiVersion: core/v1
kind: StaticFileHandler
metadata:
  name: "default"
  namespace: "default"
spec: {}
```

## Resource Definition

StaticFileHandler is defined in the [proto/core/v1/static.proto]({{% github-url "proto/core/v1/static.proto" %}})

```proto
{{% github-raw "proto/core/v1/static.proto" %}}
```
