---
title: Health Check Handler (HTTP health checking)
linkTitle: Health Check Handler
type: docs
categories: ["reference", "app/v1"]
tags: ["HealthCheckHandler"]
description: "HealthCheckHandler is an HTTP handler that is used for health checks. e.g. liveness probe."
weight: 10
params:
  ref: "main"
---

## Overview

`HealthCheckHandler` is an handler that can be used for health checks.

It works as:

- `HTTP Handler`

Config yaml format becomes like below.
And the resource specific spec is defined in in the proto format shown in the [Resource Definition](#resource-definition).

```yaml
apiVersion: core/v1
kind: HealthCheckHandler
metadata:
  name: "default"
  namespace: "default"
spec: {}
```

## Features

### 1. Return health status

The HealthCheckHandler returns a 200 OK status to the health check request.

## Resource Definition

HealthCheckHandler is defined in the [proto/app/v1/handler/healthcheck.proto]({{% github-url "proto/app/v1/handler/healthcheck.proto" %}})

```proto
{{% github-raw "proto/app/v1/handler/healthcheck.proto" %}}
```
