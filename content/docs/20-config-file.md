---
title: Config File
linkTitle: Config File
identifier: Config File
slug: config-file
type: docs
categories: ["config"]
tags: ["config"]
description: "About configuration file"
weight: 20
---

## APIs

AILERON Gateway define each features as decoupled resources.
Resources are defined with the following 3 attributes.
This concept is derived from the [Kubernetes API Concepts](https://kubernetes.io/docs/reference/using-api/api-concepts/).

- `API Group`: The group of apis. e.g. `core`, `app`.
- `API Version`: The version in a api group. e.g. `v1`, `v1alpha1`, `v1beta1`.
- `Kind`: The name of resources. e.g. `Entrypoint`, `HTTPServer`.

In addition to above, the instances af a resources are identified with `namespace` and `name`.

- `Namespace`: Logical group of resource instances.
- `Name`: Name of a resource instance.

As a result, all resource instances has their unique identifier defined with this.

`<API Group>/<API Version>/<Kind>/<Namespace>/<Name>`

## Configuration format

Use following format to define an instance of a resource.

```yaml
apiVersion: <API Version>/<API Group>
kind: <Kind>
metadata:
  namespace: <Namespace>
  name: <Name>
spec: {}
```

Config files should be following format with their appropriate file extension.

- `.yaml`: YAML format config.
- `.yml`: YAML format config.
- `.json`: JSON format config.

For example, this yaml define an HTTP server.

```yaml
apiVersion: core/v1
kind: HTTPServer
spec:
  addr: ":8080"
```

And it is identical to

```yaml
apiVersion: core/v1
kind: HTTPServer
metadata:
  namespace: default # "default" is used if omitted.
  name: default      # "default" is used if omitted.
spec:
  addr: ":8080"
```
