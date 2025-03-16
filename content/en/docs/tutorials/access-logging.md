---
title: Access Logging
linkTitle: Access Logging
identifier: Access Logging
type: docs
categories: []
tags: []
description: ""
---

## Overview

This tutorial shows how to do access logging.
`HTTPLogger` is used for access logging.
It works as middleware.

![access-logging.svg](../image/access-logging.svg)

## Run minimally

Minimal configuration will be

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
    - middleware:
        - apiVersion: core/v1
          kind: HTTPLogger
      handlers:
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

---
apiVersion: core/v1
kind: HTTPLogger
spec: {}
```

This minimal configuration uses a reverse proxy which proxies requests ot [http://httpbin.org](http://httpbin.org).
`HTTPLogger` does not require any configuration in its spec.

Run the AILERON Gateway with the configuration.

```bash
aileron -f /path/to/config.yaml
```

Then send some HTTP requests.

```bash
$ curl http://localhost:8080/get

{
  "args": {},
  "headers": {
    "Accept": "*/*",
    "Host": "httpbin.org",
    "User-Agent": "curl/8.10.1",
    "X-Amzn-Trace-Id": "Root=1-67d6cc7b-12eb83c1736f9bce0d8e6842",
    "X-Forwarded-Host": "localhost:8080"
  },
  "origin": "::1, 106.73.5.65",
  "url": "http://localhost:8080/get"
}
```

Access logs will be shown on terminal.

The **request log** and the **response log** are output as different lines.
They are associated with the log id which means `request.id == response.id`.

```json
{
   "time":"2025-03-16 22:05:01",
   "level":"INFO",
   "msg":"server",
   "datetime":{
      "date":"2025-03-16",
      "time":"22:05:01.028",
      "zone":"Local"
   },
   "location":{
      "file":"httplogger/base.go",
      "func":"httplogger.(*baseLogger).logOutput",
      "line":172
   },
   "request":{
      "header":{},
      "host":"localhost:8080",
      "id":"LbdZiWfWzH0AAAAAAAAB",
      "method":"GET",
      "path":"/get",
      "proto":"HTTP/1.1",
      "query":"",
      "remote":"[::1]:40620",
      "size":0,
      "time":"2025-03-16 22:05:01.028"
   }
}

{
   "time":"2025-03-16 22:05:01",
   "level":"INFO",
   "msg":"server",
   "datetime":{
      "date":"2025-03-16",
      "time":"22:05:01.569",
      "zone":"Local"
   },
   "location":{
      "file":"httplogger/base.go",
      "func":"httplogger.(*baseLogger).logOutput",
      "line":172
   },
   "response":{
      "duration":541105,
      "header":{},
      "id":"LbdZiWfWzH0AAAAAAAAB",
      "size":303,
      "status":200,
      "time":"2025-03-16 22:05:01.569"
   }
}
```

**That's it!!**

## Customization

{{% alert title="Info" color="info" %}}
This section is being prepared.
{{% /alert %}}
