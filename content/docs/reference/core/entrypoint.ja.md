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

## 概要

Entrypoint はゲートウェイのエントリーポイントとして使われる特別なリソースです。  
他のリソースとは異なり、インスタンスは一つだけ許可されています。

以下の YAML は、空の spec を持つ Entrypoint 定義の例です。  
Entrypoint リソースは一つだけ許可される特別なリソースであるため、`metadata:` は不要であり、指定されたとしても無視されます。

```yaml
apiVersion: core/v1
kind: Entrypoint
spec: {}
```

## リソース定義

Entrypoint は [proto/core/v1/entrypoint.proto]({{% github-url "proto/core/v1/entrypoint.proto" %}}) に定義されています。

```proto {linenos=inline}
{{% github-raw "proto/core/v1/entrypoint.proto" %}}
```

## YAML構造

**core/v1/Entrypoint:**

```yaml {linenos=inline}
apiVersion: <string>
kind: <string>
metadata: <object>
  name: <string>
  namespace: <string>
spec: <object>
  defaultLogger: <object>
    apiVersion: <string>
    kind: <string>
    name: <string>
    namespace: <string>
  loggers: <[]object>
    - apiVersion: <string>
      kind: <string>
      name: <string>
      namespace: <string>
  defaultErrorHandler: <object>
    apiVersion: <string>
    kind: <string>
    name: <string>
    namespace: <string>
  runners: <[]object>
    - apiVersion: <string>
      kind: <string>
      name: <string>
      namespace: <string>
  initializers: <[]object>
    - apiVersion: <string>
      kind: <string>
      name: <string>
      namespace: <string>
  finalizers: <[]object>
    - apiVersion: <string>
      kind: <string>
      name: <string>
      namespace: <string>
```

## 例
