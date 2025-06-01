---
title: HTTPServer
linkTitle: HTTP Server
type: docs
categories: ["reference", "core/v1"]
tags: ["HTTPServer"]
description: "HTTPServer runs HTTP/1.2 HTTP/2 and HTTP/3 server(s)."
weight: 10
params:
  ref: "main"
---

## Overview

`HTTPServer` is the basic HTTP1.1 and HHTP2 server resource.

Config yaml format becomes like below.
And the resource specific spec is defined in in the proto format shown in the [Resource Definition](#resource-definition).

```yaml
apiVersion: core/v1
kind: HTTPServer
metadata:
  name: "default"
  namespace: "default"
spec: {}
```

## Resource Definition

HTTPServer is defined in the [proto/core/v1/httpserver.proto]({{% github-url "proto/core/v1/httpserver.proto" %}})

```proto
{{% github-raw "proto/core/v1/httpserver.proto" %}}
```
