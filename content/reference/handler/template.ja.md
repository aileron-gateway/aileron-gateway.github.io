---
title: TemplateHandler (Serving templated contents)
linkTitle: "🤚Template Handler"
type: docs
categories: ["reference", "core/v1"]
tags: ["TemplateHandler"]
description: ""
weight: 4030
params:
  ref: "main"
---

## Overview

TemplateHandler servers templated contents.

Config yaml format becomes like below.
And the resource specific spec is defined in in the proto format shown in the [Resource Definition](#resource-definition).

```yaml
apiVersion: core/v1
kind: TemplateHandler
metadata:
  name: "default"
  namespace: "default"
spec: {}
```

## Resource Definition

TemplateHandler is defined in the [proto/core/v1/template.proto]({{% github-url "proto/core/v1/template.proto" %}})

```proto {linenos=inline}
{{% github-raw "proto/core/v1/template.proto" %}}
```
