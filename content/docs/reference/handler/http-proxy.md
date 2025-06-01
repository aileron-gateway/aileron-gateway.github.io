---
title: ReverseProxyHandler (HTTP Proxy)
linkTitle: Reverse Proxy Handler
type: docs
categories: ["reference", "core/v1"]
tags: ["ReverseProxyHandler"]
description: ""
weight: 10
params:
  ref: "main"
---

## Overview

`ReverseProxyHandler` is a HTTP proxy handler.
It is the very basic resources for AILERON Gateway to work as a gateway.

It works as:

- `HTTP Handler`

Config yaml format becomes like below.
And the resource specific spec is defined in in the proto format shown in the [Resource Definition](#resource-definition).

```yaml
apiVersion: core/v1
kind: ReverseProxyHandler
metadata:
  name: "default"
  namespace: "default"
spec: {}
```

## Features

### 1. Proxy request

ReverseProxyHandler proxies following types of requests.

- Proxy known size request such as json or xml
- Proxy [WebSocket](https://en.wikipedia.org/wiki/WebSocket)
- Proxy [SSE: Server-sent event](https://en.wikipedia.org/wiki/Server-sent_events)
- Proxy [chunked](https://en.wikipedia.org/wiki/Chunked_transfer_encoding) requests

### 2. Load Balancing

The ReverseProxyHandler supports following load balancing algorithm.

| LB Algorithm           | Hash based | Consistent | When assigned upstream inactive           |
| ---------------------- | ---------- | ---------- | ----------------------------------------- |
| (Weighted) Round Robin | No         | -          | Skip inactive upstream.                   |
| (Weighted) Random      | No         | -          | Skip inactive upstream.                   |
| (Weighted) Direct Hash | Yes        | No         | Error.                                    |
| (Weighted) Ring Hash   | Yes        | Yes        | Skip inactive upstream.                   |
| (Weighted) Maglev      | Yes        | Yes        | Recalculate hash table.                   |

Following hash sources are available for hash based load balancing.

Hash Source Limitations:

- Only 1 value is randomly used if there were multiple header values bounded to a single key.
- Only 1 value is randomly used if there were multiple query values bounded to a single key.
- ReverseProxyHandler must be registered to a server with path parameter pattern. See [http#ServeMux](https://pkg.go.dev/net/http#ServeMux).

| Hashing Methods | Hash Source                                                 |
| --------------- | ----------------------------------------------------------- |
| Header          | A header value.                                             |
| Multiple Header | A joined string of header values.                           |
| Header Pattern  | A string extracted from header value by regular expression. |
| Cookie          | A cookie value.                                             |
| Query           | A URL query value.                                          |
| Path Param      | A URL path parameter.                                       |
| Client Addr     | Client ip and port.                                         |

### 3. Rremove Hop-by-hop headers

Hop-by-Hop headers are removed when proxying requests.
Headers to be removed are described in [RFC 7230](https://datatracker.ietf.org/doc/rfc7230/) and [RFC 2616](https://datatracker.ietf.org/doc/rfc2616/).
One of the reference implementations would be [httputil/reverseproxy.go](https://go.dev/src/net/http/httputil/reverseproxy.go).

AILERON Gateway removes following headers from requests to be proxied.

- `Connection`
- `Keep-Alive`
- `Proxy-Connection`
- `Proxy-Authenticate`
- `Proxy-Authorization`
- `Te`
- `Trailer`
- `Transfer-Encoding`
- `Upgrade`
- Headers listed in `Connection`

### 4. Adding forwarded headers

[Forwarded](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Forwarded) related headers are added to the proxy headers.
[X-Forwarded-For](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Forwarded-For), [X-Forwarded-Host](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Forwarded-Host), X-Forwarded-Port and [X-Forwarded-Proto](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Forwarded-Proto) are added.
But [Forwarded](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Forwarded) header is not added itself.
This is because the `X-Forwarded-*` header is more generally used than `Forwarded` itself.

Following table shows the forwarded headers and the example values.

| Header            | Added | Prior values | Value                 | Example                  |
| ----------------- | ----- | ------------ | --------------------- | ------------------------ |
| X-Forwarded-For   | Yes   | Keep         | Client IP address     | `192.167.0.1, 127.0.0.1` |
| X-Forwarded-Port  | Yes   | Discard      | Client port number    | `12345`                  |
| X-Forwarded-Host  | Yes   | Discard      | Requested host name   | `example.com`            |
| X-Forwarded-Proto | Yes   | Discard      | Requested scheme      | `http` or `https`        |
| Forwarded         | No    | -            | All of above          | -                        |

## Resource Definition

ReverseProxyHandler is defined in the [proto/core/v1/httpproxy.proto]({{% github-url "proto/core/v1/httpproxy.proto" %}})

```proto
{{% github-raw "proto/core/v1/httpproxy.proto" %}}
```

## References

- [Circuit Breaker pattern](https://learn.microsoft.com/en-us/azure/architecture/patterns/circuit-breaker)
- [Load Balancing -Envoy](https://www.envoyproxy.io/docs/envoy/latest/intro/arch_overview/upstream/load_balancing/load_balancing)
- [HTTP Load Balancing - Nginx](https://docs.nginx.com/nginx/admin-guide/load-balancer/http-load-balancer/)
- [Load Balancing Reference - Kong Gateway](https://docs.konghq.com/gateway/latest/how-kong-works/load-balancing/)
- [HAPROXY documentation](https://www.haproxy.com/documentation/haproxy-configuration-manual/latest/#4.2-balance)
- [ApisixUpstream](https://apisix.apache.org/docs/ingress-controller/references/apisix_upstream/)
- [Load Balancing - API7.ai](https://docs.api7.ai/apisix/key-concepts/upstreams#load-balancing)
- [Maglev: A Fast and Reliable Software Network Load Balancer](https://research.google/pubs/maglev-a-fast-and-reliable-software-network-load-balancer/)
- [Maglev A Fast and Reliable Network Load Balancer](https://www.usenix.org/sites/default/files/conference/protected-files/nsdi16_slides_eisenbud.pdf)
- [Weighted round robin - Wikipedia](https://en.wikipedia.org/wiki/Weighted_round_robin)
- [Consistent hashing - Wikipedia](https://en.wikipedia.org/wiki/Consistent_hashing)
- [HTTP headers and Application Load Balancers - AWS](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/x-forwarded-headers.html)
- [HTTP headers and Classic Load Balancers- AWS](https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/x-forwarded-headers.html)
