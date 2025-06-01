---
title: Entrypoint
linkTitle: Entrypoint
type: docs
categories: ["reference", "core/v1"]
tags: ["Entrypoint"]
description: ""
weight: 10
params:
  ref: "main"
---

## Overview

Entrypoint is the special resource that is used as entrypoint of the gateway.
Unlike other resources, only one instance is allowed.

This yaml show the Entrypoint definition with empty spec.
Because the Entrypoitn resource is special resource that is allowed only single instance,
`metadata:` is not required and is ignored.

```yaml
apiVersion: core/v1
kind: Entrypoint
spec: {}
```

## Resource Definition

Entrypoint is defined in the [proto/core/v1/entrypoint.proto]({{% github-url "proto/core/v1/entrypoint.proto" %}})

```proto
{{% github-raw "proto/core/v1/entrypoint.proto" %}}
```
