---
title: How it works?
linkTitle: How It Works
identifier: How It Works
slug: how-it-works
type: docs
categories: []
tags: []
description: ""
weight: 10
---

## Single Binary Single Config

Thanks to the [Go](https://go.dev/), AILERON Gateway is built as a single and standalone binary.
No dependencies are required for your environment.
It makes the AILERON Gateway simple and easy to use.
No control planes, no databases are required.

You need **just a single binary, single config file** to run the AILERON Gateway.

It's very easy to run.

```bash
aileron -f /path/to/config
```

## Server/Client Architecture

AILERON Gateway uses a typical architecture of HTTP server of Go applications.
There are two major objects, `Middleware` and `Handler`.
`Middleware`, which sometimes called filter or interceptor in other languages, provides intermediate processing for HTTP requests.
`Handler` provides terminate processing for API requests.
All API endpoints are made up with the combination of middleware and handlers.
Middleware can be shared with multiple handlers.
"Mux" or multiplexer dispatches API requests to the right handler.

- Example of middleware
  - Logging
  - Throttling
  - CORS, CSRF
  - Authentication
  - Authorization
- Example of handlers
  - Reverse Proxy
  - File server

Following figure shows the architecture of a HTTP server in AILERON Gateway.
A single http server uses multiple multiplexers to support virtual host.
Mux, middleware and handlers have their unique interface.

![http-server.svg](/aileron/http-server.svg)

HTTP clients consist of two major objects, `Tripperware` and `RoundTripper`.
`Tripperware`, which corresponds to middleware of a server, provides intermediate processing for HTTP clients.
`RoundTripper`, which corresponds to handlers of a server, provides terminate processing for HTTP clients.

- Example of tripperware
  - Logging
  - Retry
- Example of RoundTripper
  - HTTP Client

Following figure shows the architecture of a HTTP client in AILERON Gateway.

![http-client.svg](/aileron/http-client.svg)
