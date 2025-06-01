---
title: ErrorHandler
linkTitle: Error Handler
type: docs
categories: ["reference", "core/v1"]
tags: ["ErrorHandler"]
description: ""
weight: 10
params:
  ref: "main"
---

## Overview

`ErrorHandler` is a error handler resource that is used for handling errors ocurred while processing requests.

Config yaml format becomes like below.
And the resource specific spec is defined in in the proto format shown in the [Resource Definition](#resource-definition).

```yaml
apiVersion: core/v1
kind: ErrorHandler
metadata:
  name: "default"
  namespace: "default"
spec: {}
```

## Resource Definition

ErrorHandler is defined in the [proto/core/v1/errhandler.proto]({{% github-url "proto/core/v1/errhandler.proto" %}})

```proto
{{% github-raw "proto/core/v1/errhandler.proto" %}}
```
