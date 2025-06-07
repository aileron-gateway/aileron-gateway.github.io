---
title: Echo Handler
linkTitle: "🤚Echo Handler"
type: docs
categories: ["reference", "app/v1"]
tags: ["EchoHandler"]
description: ""
weight: 4040
params:
  ref: "main"
---

## Overview

`EchoHandler` is an simple echo handler.
It returns the request information.

It works as:

- `HTTP Handler`

Config yaml format becomes like below.
And the resource specific spec is defined in in the proto format shown in the [Resource Definition](#resource-definition).

```yaml
apiVersion: app/v1
kind: EchoHandler
metadata:
  name: "default"
  namespace: "default"
spec: {}
```

## Features

### 1. Request information response

Echo handler respond the requet information.

## Resource Definition

EchoHandler is defined in the [proto/app/v1/handler/echo.proto]({{% github-url "proto/app/v1/handler/echo.proto" %}})

```proto {linenos=inline}
{{% github-raw "proto/app/v1/handler/echo.proto" %}}
```
