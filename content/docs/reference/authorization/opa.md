---
title: OPAAuthzMiddleware (Open Policy Agent)
linkTitle: Open Policy Agent
type: docs
categories: ["reference", "app/v1"]
tags: ["OPAAuthzMiddleware"]
description: ""
weight: 20
params:
  ref: "main"
---

## Overview

`OPAAuthzMiddleware` authorize requests with [Open Policy Agent](https://www.openpolicyagent.org/).

Config yaml format becomes like below.
And the resource specific spec is defined in in the proto format shown in the [Resource Definition](#resource-definition).

```yaml
apiVersion: app/v1
kind: OPAAuthzMiddleware
metadata:
  name: "default"
  namespace: "default"
spec: {}
```

## Resource Definition

OPAAuthzMiddleware is defined in the [proto/app/v1/authz/opa.proto]({{% github-url "proto/app/v1/authz/opa.proto" %}})

```proto
{{% github-raw "proto/app/v1/authz/opa.proto" %}}
```
