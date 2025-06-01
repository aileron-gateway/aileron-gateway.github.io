---
title: Application
linkTitle: Application
identifier: Application
slug: application
type: docs
categories: []
tags: []
description: ""
weight: 5
---

## Execution

Because the AILERON Gateway is written in [Go](https://go.dev/),
a `main()` function is the entrypoint of a binary as described in the [Go Specification](https://go.dev/ref/spec#Program_execution).

The main function of the AILERON Gateway is written in [cmd/aileron/aileron.go](https://github.com/aileron-gateway/aileron-gateway/blob/main/cmd/aileron/aileron.go).

```go
func main(){
  // Starting up the AILERON Gateway.
}
```

After entering the main function, AILERON Gateway starts with the lifecycle described in the [Lifecycle](#lifecycle).

## Lifecycle

After entering the `main()` function, AILERON Gateway starts the following process.

Briefly describing, it

- Processes command line arguments.
- Reads and processes config files.
- Runs a entrypoint resource (= Run HTTP servers)

![lifecycle.svg](lifecycle.svg)

The `Entrypoint` resource is the entrypoint of the application.
It can run any `Runner` resources. Runner resources are the resources that implements following runner interface.
HTTP servers are typical example of this kind of resources.

```go
type Runner interface {
  Run(context.Context) error
}
```

This figure shows that the main function calls runners and OS signals are propagated from main to runners.
HTTP servers are shutdown when it received a signal.

![process-tree.svg](process-tree.svg)
