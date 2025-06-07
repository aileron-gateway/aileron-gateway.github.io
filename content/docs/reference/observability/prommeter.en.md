---
title: PrometheusMeter
linkTitle: "🔭Prometheus Metrics"
type: docs
categories: ["reference", "app/v1"]
tags: ["PrometheusMeter"]
description: ""
weight: 1010
params:
  ref: "main"
---

## Overview

Config yaml format becomes like below.
And the resource specific spec is defined in in the proto format shown in the [Resource Definition](#resource-definition).

```yaml
apiVersion: app/v1
kind: PrometheusMeter
metadata:
  name: "default"
  namespace: "default"
spec: {}
```

## Resource Definition

PrometheusMeter is defined in the [proto/app/v1/o11y/prommeter.proto]({{% github-url "proto/app/v1/o11y/prommeter.proto" %}})

```proto {linenos=inline}
{{% github-raw "proto/app/v1/o11y/prommeter.proto" %}}
```
