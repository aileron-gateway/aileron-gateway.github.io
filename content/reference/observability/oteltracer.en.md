---
title: OpenTelemetryTracer
linkTitle: "🔭OpenTelemetry Tracing"
type: docs
categories: ["reference", "app/v1"]
tags: ["OpenTelemetryTracer"]
description: ""
weight: 1020
params:
  ref: "main"
---

## Overview

Config yaml format becomes like below.
And the resource specific spec is defined in in the proto format shown in the [Resource Definition](#resource-definition).

```yaml
apiVersion: app/v1
kind: OpenTelemetryTracer
metadata:
  name: "default"
  namespace: "default"
spec: {}
```

## Resource Definition

OpenTelemetryTracer is defined in the [proto/app/v1/o11y/oteltracer.proto]({{% github-url "proto/app/v1/o11y/oteltracer.proto" %}})

```proto {linenos=inline}
{{% github-raw "proto/app/v1/o11y/oteltracer.proto" %}}
```
