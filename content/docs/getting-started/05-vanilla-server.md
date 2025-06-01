---
title: Vanilla Server
linkTitle: Vanilla Server
identifier: Vanilla Server
slug: vanilla-server
type: docs
categories: []
tags: ["getting-started"]
description: "Run a vanilla server. The simplest tutorial."
weight: 5
---

![vanilla-server.svg](../image/vanilla-server.svg)

## Overview

This getting started tutorials runs a vanilla HTTP server.
Because vanilla HTTP servers in AILERON Gateway does not have any handlers except for NotFound handler,
404 Not Found responses are returned for all requests in this tutorial.

## Run a single server

Write config like below.
This config define a single HTTP server to start with port `:8080`.

Defined resources are:

- `core/v1/Entrypoint`: Definition of entrypoint. This MUST be defined for all configs.
- `core/v1/HTTPServer`: Definition of a single HTTP server instance.

```yaml
apiVersion: core/v1
kind: Entrypoint
spec:
  runners:
    - apiVersion: core/v1
      kind: HTTPServer

---
apiVersion: core/v1
kind: HTTPServer
spec:
  addr: ":8080"
```

**That's it!!**

Then, run AILERON Gateway with the config.
The command will be

```bash
aileron -f /path/to/config.yaml
```

Send HTTP request to the server.
It returns 404 Not Found because no handlers have not been registered to the server yet.

```bash
$ curl http://localhost:8080
{"status":404,"statusText":"Not Found"}
```

## Run multiple servers

It's very easy to add more servers to the AILERON Gateway.

This time, define 3 HTTP servers like below.
This config starts 3 servers which listen on `:8081`, `:8082` and `:8083` port.

HTTP Server definition has their own name to make it possible to identify the instances.

Defined resources are:

- `core/v1/Entrypoint`: Definition of entrypoint. This MUST be defined for all configs.
- `core/v1/HTTPServer/default/server1`: Definition of `:8081` server instance. (`default` is the default namespace name.)
- `core/v1/HTTPServer/default/server2`: Definition of `:8082` server instance. (`default` is the default namespace name.)
- `core/v1/HTTPServer/default/server3`: Definition of `:8083` server instance. (`default` is the default namespace name.)

```yaml
apiVersion: core/v1
kind: Entrypoint
spec:
  runners:
    - apiVersion: core/v1
      kind: HTTPServer
      name: server1
    - apiVersion: core/v1
      kind: HTTPServer
      name: server2
    - apiVersion: core/v1
      kind: HTTPServer
      name: server3

---
apiVersion: core/v1
kind: HTTPServer
metadata:
  name: server1
spec:
  addr: ":8081"

---
apiVersion: core/v1
kind: HTTPServer
metadata:
  name: server2
spec:
  addr: ":8082"

---
apiVersion: core/v1
kind: HTTPServer
metadata:
  name: server3
spec:
  addr: ":8083"
```

Let's restart the AILERON Gateway and send HTTP requests for each servers.

```bash
aileron -f /path/to/config.yaml
```

```bash
$ curl http://localhost:8081
{"status":404,"statusText":"Not Found"}

$ curl http://localhost:8082
{"status":404,"statusText":"Not Found"}

$ curl http://localhost:8083
{"status":404,"statusText":"Not Found"}
```

We now know 3 servers are running on the single AILERON Gateway process!
