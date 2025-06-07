---
title: Docs
linkTitle: Docs
type: docs
categories: []
tags: []
description: "AILERON Gateway is a secure and high-performance API Gateway for enterprise systems."
menu:
  main:
    weight: 10
---

<h2>AILERON Gateway is a secure and high-performance API Gateway for enterprise systems.</h2>

AILERON Gateway is a very simple Layer4/7 API Gateway written in [Go](https://go.dev/).
It focuses on basic features rather than adding many features.

In particular, we focus on the following 3 domains and aim to support enterprise-graded features.

1. **API Management**
2. **Security**
3. **Observability**

</br>
</br>

This is an overview of AILERON Gateway.

</br>

{{% image source="features.svg" %}}

## API Management

| Feature               | Supported | Planned | Not Planned |
| --------------------- | --------- | ------- | ----------- |
| ReverseProxy          | ✅ Yes    | -       | -           |
| Static Content Server | ✅ Yes    | -       | -           |
| Protocol Transform    | ❌ No     | ✅ Yes  | -           |
| API Aggregation       | ❌ No     | ❌ No   | ✅ Yes      |

## Traffic Management

| Feature        | Supported | Planned | Not Planned |
| -------------- | --------- | ------- | ----------- |
| Routing        | ✅ Yes    | -       | -           |
| Load Balancing | ✅ Yes    | -       | -           |
| Timeout        | ✅ Yes    | -       | -           |
| Retry          | ✅ Yes    | -       | -           |
| Rate Limiting  | ✅ Yes    | -       | -           |
| CircuitBreaker | ❌ No     | ✅ Yes  | -           |
| BulkHead       | ❌ No     | ✅ Yes  | -           |
| Cache          | ❌ No     | ❌ No   | ✅ Yes     |

## Security

| Feature                      | Supported | Planned | Not Planned |
| ---------------------------- | --------- | ------- | ----------- |
| Authorization                | ✅ Yes    | -       | -           |
| Authentication               | ✅ Yes    | -       | -           |
| Request Header Modification  | ✅ Yes    | -       | -           |
| Response Header Modification | ✅ Yes    | -       | -           |
| IP whitelist                 | ✅ Yes    | -       | -           |
| IP blacklist                 | ✅ Yes    | -       | -           |
| TLS / mutual TLS             | ✅ Yes    | -       | -           |
| Log Masking                  | ✅ Yes    | -       | -           |
| Request Validation           | ❌ No     | ✅ Yes  | -           |
| Response Validation          | ❌ No     | ✅ Yes  | -           |
| Bot Detection                | ❌ No     | ❌ No   | ✅ Yes      |

## Operation

| Feature              | Supported | Planned | Not Planned |
| -------------------- | --------- | ------- | ----------- |
| Structured Logging   | ✅ Yes    | -       | -           |
| Unstructured Logging | ✅ Yes    | -       | -           |
| Metrics              | ✅ Yes    | -       | -           |
| Tracing              | ✅ Yes    | -       | -           |
| Profiling            | ✅ Yes    | -       | -           |
| Alert                | ❌ No     | ❌ No   | ✅ Yes     |

## Extension

| Feature     | Supported | Planned | Not Planned |
| ----------- | --------- | ------- | ----------- |
| Go Package  | ✅ Yes    | -       | -           |
| GoPlugin    | ✅ Yes    | -       | -           |
| WebAssembly | ❌ No     | ✅ Yes | -           |
| IPC         | ❌ No     | ✅ Yes | -           |
