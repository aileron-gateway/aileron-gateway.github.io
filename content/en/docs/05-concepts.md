---
title: Concepts
linkTitle: Concepts
identifier: Concepts
slug: concepts
type: docs
categories: []
tags: []
description: ""
weight: 5
---

## Our Mission

**Our mission is to build a high-performance, secure, and production-grade API Gateway
without compromising on maintainability and usability.**

## Design Principles

4 design principles are defined to achieve consistent growth.

- **Simple and Clear Architecture**: Architecture must be simple that all uses and developers can understand with lesser time.
- **Highly Customizable and Extensible**: AILERON Gateway must be extensible as much as possible to cover wider use cases.
- **Production Grade**: All features must be well tested and be robust to reduce unexpected error on runtime.
- **Secure**: Security is prior to anything else.

## Implementation Principles

5 implementation principles are defined to give directions for developers.

- **Highly Customizable**: All features should be configurable as much as possible.
- **Usability First**: Think how the features are used. Make configuration intuitive.
- **Secure by Default**: Features should work secure by default.
- **Minimize Requirement**: Reduce the number of required configurations.
- **Highly Decoupled**: Decouple the components and connect them using interfaces.

## Reference System Architecture

AILERON Gateway consider the following architecture as the environment where the it works.

- Ingress
  - can be called from edge computers.
  - can be called from batch applications.
    - may be take longer than the normal API call
    - may require special considerations for authn/authz
  - can come through WAF
  - can come through CDN
    - cache should be considered
  - can come from other gateways
  - can come from MPAs and SPAs, or native apps
  - can come from user-agent based apps (e.g. browser apps) and non user-agent based apps
- Egress
  - can go to synchronous upstream applications
  - can go to asynchronous upstream applications
  - can go to serverless applications
- Run on
  - On-Premise
  - Virtual Machines
  - Containers

![reference-architecture.svg](/aileron/reference-architecture.svg)
