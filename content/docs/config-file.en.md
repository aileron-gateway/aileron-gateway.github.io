---
title: Config File
linkTitle: Config File
type: docs
categories: []
tags: []
description: "About configuration file"
weight: 40
---

## APIs

AILERON Gateway define each features as decoupled resources.
Resources are defined with the following 3 attributes.
This concept is borrowed from the [Kubernetes](https://kubernetes.io/).
See [Kubernetes API Concepts](https://kubernetes.io/docs/reference/using-api/api-concepts/) and [Objects In Kubernetes](https://kubernetes.io/docs/concepts/overview/working-with-objects/).

- `API Group`: The group of apis. e.g. `core`, `app`.
- `API Version`: The version in a api group. e.g. `v1`, `v1alpha1`, `v1beta1`.
- `Kind`: The name of resources. e.g. `Entrypoint`, `HTTPServer`.

In addition to above, the instances af a resources are identified with `namespace` and `name`.

- `Namespace`: Logical group of resource instances.
- `Name`: Name of a resource instance.

As a result, all resource instances has their unique identifier defined with this.

`<API Group>/<API Version>/<Kind>/<Namespace>/<Name>`

In the context of AILERON Gateway, the `API` refers to a kind of resource such as HTTP server or middleware.
APIs and operation to them are managed by the AILERON Gateway internally under the architecture.

{{% image source="api.svg" %}}

## Configuration format

All resources have the following config structure.

```yaml
apiVersion:    <string> API group and version.
kind:          <string> API kind name.
metadata:      <object>
    namespace: <string> Namespace name for logical separation of this instances.
    name:      <string> Name of this instance. Unique in namespace.
spec:          <object> API specific configurations.
```

That means a yaml like below is the basic format to define resources to use.

```yaml
apiVersion: <API Version>/<API Group>
kind: <Kind>
metadata:
  namespace: <Namespace>
  name: <Name>
spec: {}
```

Config files should be following format with their appropriate file extension.
**yaml** and **json** format are supported as the manifest.
AILERON Gateway loads the given manifests on start up and create objects.

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
