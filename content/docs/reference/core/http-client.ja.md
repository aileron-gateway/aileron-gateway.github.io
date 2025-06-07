---
title: HTTPClient
linkTitle: HTTP Client
type: docs
categories: ["reference", "core/v1"]
tags: ["HTTPClient"]
description: ""
weight: 10
params:
  ref: "main"
---

## Overview

`HTTPClient` is a HTTP client resource.
This is used, for example, requesting proxy requests to upstresm services.

Config yaml format becomes like below.
And the resource specific spec is defined in in the proto format shown in the [Resource Definition](#resource-definition).

```yaml
apiVersion: core/v1
kind: HTTPClient
metadata:
  name: "default"
  namespace: "default"
spec: {}
```

## Resource Definition

HTTPClient is defined in the [proto/core/v1/httpclient.proto]({{% github-url "proto/core/v1/httpclient.proto" %}})

```proto {linenos=inline}
{{% github-raw "proto/core/v1/httpclient.proto" %}}
```
