---
title: Reverse Proxy
linkTitle: Reverse Proxy
identifier: Reverse Proxy
slug: reverse-proxy
type: docs
categories: []
tags: ["getting-started"]
description: "Run a reverse proxy server. The most basic feature as a API Gateway."
weight: 10
---


![reverse-proxy.svg](../image/reverse-proxy.svg)

## Overview

This getting started tutorials runs a reverse proxy server.
Reverse proxy server proxies requests to the upstream services.

## Run a proxy server

First, write config file as below and save it in a file such as `config.yaml`.
In this example, [http://httpbin.org](http://httpbin.org) is used as the upstream service.
Make sure your environment is accessible to the upstream service.

If you are on the behind of a proxy, use `http_proxy` and `https_proxy` environment variable.

Defined resources are:

- `core/v1/Entrypoint`: Definition of entrypoint. This MUST be defined for all configs.
- `core/v1/HTTPServer`: Definition of a HTTP server instance referred by the Entrypoint.
- `core/v1/ReverseProxyHandler`: Definition of a reverse proxy handler instance referred by the HTTPServer.

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
  virtualHosts:
    - handlers:
        - handler:
            apiVersion: core/v1
            kind: ReverseProxyHandler

---
apiVersion: core/v1
kind: ReverseProxyHandler
spec:
  loadBalancers:
    - pathMatcher:
        match: "/"
        matchType: Prefix
      upstreams:
        - url: http://httpbin.org
        # - url: http://worldtimeapi.org    # Use this as you want!
        # - url: http://ipconfig.io         # Use this as you want!
        # - url: http://ifconfig.io         # Use this as you want!
```

Let's restart the AILERON Gateway with the config.

```bash
aileron -f /path/to/config.yaml
```

Then send some requests.

**GET request.**

```bash
$ curl http://localhost:8080/get
{
  "args": {},
  "headers": {
    "Accept": "*/*",
    "Host": "httpbin.org",
    "User-Agent": "curl/8.10.1",
    "X-Amzn-Trace-Id": "Root=1-67d69d5e-040fd45244e0b1d43273c770",
    "X-Forwarded-Host": "localhost:8080"
  },
  "origin": "::1, 106.73.5.65",
  "url": "http://localhost:8080/get"
}
```

**POST request.**

```bash
$ curl -XPOST http://localhost:8080/post
{
  "args": {},
  "data": "",
  "files": {},
  "form": {},
  "headers": {
    "Accept": "*/*",
    "Content-Length": "0",
    "Host": "httpbin.org",
    "User-Agent": "curl/8.10.1",
    "X-Amzn-Trace-Id": "Root=1-67d69d90-73fa1e40350058bf581d9414",
    "X-Forwarded-Host": "localhost:8080"
  },
  "json": null,
  "origin": "::1, 106.73.5.65",
  "url": "http://localhost:8080/post"
}
```
