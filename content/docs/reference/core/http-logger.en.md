---
title: HTTPLogger (Access logging)
linkTitle: HTTP Logger
type: docs
categories: ["reference", "core/v1"]
tags: ["HTTPLogger"]
description: "HTTPLogger outputs requests and response logs."
weight: 10
params:
  ref: "main"
---

## Overview

`HTTPLogger` is the resource for logging requests and responses.
`HTTPLoger` can be used as

- `Middleware`
- `Tripperware`

Config yaml format becomes like below.
And the resource specific spec is defined in in the proto format shown in the [Resource Definition](#resource-definition).

```yaml
apiVersion: core/v1
kind: HTTPLogger
metadata:
  name: "default"
  namespace: "default"
spec: {}
```

## Resource Definition

HTTPLogger is defined in the [proto/core/v1/httplogger.proto]({{% github-url "proto/core/v1/httplogger.proto" %}})

```proto {linenos=inline}
{{% github-raw "proto/core/v1/httplogger.proto" %}}
```
