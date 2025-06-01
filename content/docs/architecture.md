---
title: Architecture
linkTitle: Architecture
type: docs
categories: []
tags: []
description: ""
weight: 20
---

## Single Binary Single Config

Thanks to the [Go](https://go.dev/), AILERON Gateway is built as a single and standalone binary.
No dependencies are required for your environment.
It makes the AILERON Gateway quite portable and easy to run.
No control planes, no databases are required.

You need **just a single binary, single config file**.

It's very easy to run.

```bash
aileron -f /path/to/config
```

See the [Getting Started](/docs/getting-started/) guide for how to use features.

## Server/Client Architecture

AILERON Gateway uses a typical architecture of HTTP server and client of Go applications.

Following image shows the layer of some basic networking protocols.
AILERON Gateway aims to support all shown protocols in the boxes of server and client.

![networks.svg](networks.svg)

For servers, there are two major components of `Middleware` and `Handler`.
`Middleware`, which sometimes called filter or interceptor in other languages, provides intermediate processing for HTTP requests.
`Handler` provides terminate processing for API requests.
All client requests are proceeded with a combination of middleware and handler.

Middleware can be shared with multiple handlers.
`Mux` or multiplexer dispatches API requests to appropriate handler.

- Some examples of middleware
  - Logging Middleware
  - Timeout Middleware
  - Throttle Middleware
  - CORS Middleware
  - CSRF Middleware
  - Authentication Middleware
  - Authorization Middleware
- Some examples of handlers
  - Reverse Proxy Handler
  - Static Handler (Static File Server)
  - Template Handler (Response contents from template)

Following figure shows the architecture of a HTTP server in AILERON Gateway.
A single http server uses multiple multiplexers to support virtual host.
Mux, middleware and handlers have their unique interface.

![http-server.svg](http-server.svg)

For clients, there are two major components of `Tripperware` and `RoundTripper`.
`Tripperware`, or client-side middleware, provides intermediate processing for HTTP clients.
`RoundTripper`, or HTTP client itself, provides terminate process for HTTP clients.

- Some examples of tripperware
  - Logging
  - Retry
  - Tracing

Following figure shows the architecture of a HTTP client in AILERON Gateway.

![http-client.svg](http-client.svg)

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
