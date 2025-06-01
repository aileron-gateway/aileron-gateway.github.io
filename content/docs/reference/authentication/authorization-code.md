---
title: Authorization Code Handler
linkTitle: AuthorizationCodeHandler
type: docs
categories: ["reference", "app/v1"]
tags: ["AuthorizationCodeHandler"]
description: "AuthorizationCodeHandler is the authentication handler used for OpenID Connect authorization code flow."
weight: 20
params:
  ref: "main"
---

## Overview

Config yaml format becomes like below.
And the resource specific spec is defined in in the proto format shown in the [Resource Definition](#resource-definition).

```yaml
apiVersion: app/v1
kind: AuthorizationCodeHandler
metadata:
  name: "default"
  namespace: "default"
spec: {}
```

## Resource Definition

AuthorizationCodeHandler is defined in the [proto/app/v1/authn/oauth.proto]({{% github-url "proto/app/v1/authn/oauth.proto" %}})

```proto
{{% github-raw "proto/app/v1/authn/oauth.proto" %}}
```
