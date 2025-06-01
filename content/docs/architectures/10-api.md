---
title: API
linkTitle: API
identifier: API
slug: api
type: docs
categories: []
tags: ["api"]
description: ""
weight: 10
---


API is the basic concept of the AILERON Gateway to create, delete, update objects.
This basic concept is strongly inspired by the [Kubernetes Cluster Architecture](https://kubernetes.io/docs/concepts/architecture/).

corresponds to an instance of component of AILERON Gateway such as HTTP Servers or Loggers.
Note that the CLI is not currently available.

![api.svg](api.svg)

`Manifest` is the definition of a single resource.

Its concept is also borrowed from the [Objects In Kubernetes](https://kubernetes.io/docs/concepts/overview/working-with-objects/).
All manifests meets the following structure which is very similar to kubernetes manifests.
Object specific configurations are set in **spec**.

```yaml
apiVersion:    <string> API group and version.
kind:          <string> API kind name.
metadata:      <object>
    namespace: <string> Namespace name for logical separation of this instances.
    name:      <string> Name of this instance. Unique in namespace.
spec:          <object> API specific configurations.
status:        <object> Status of this instance. Read-only.
```

**yaml** and **json** format are supported as the manifest.
AILERON Gateway loads the given manifests on start up and create objects.

## References

- [Cluster Architecture](https://kubernetes.io/docs/concepts/architecture/)
- [Objects In Kubernetes](https://kubernetes.io/docs/concepts/overview/working-with-objects/)
