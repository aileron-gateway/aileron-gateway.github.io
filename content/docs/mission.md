---
title: Mission
linkTitle: Mission
type: docs
categories: []
tags: []
description: ""
weight: 10
---

## Our Mission

**Our mission is to build a high-performance, secure, and production-grade API Gateway without compromising on maintainability and usability.**
**We put high priority on good user experience.**

## Design Principles

4 design principles are defined to achieve consistent growth.

- **Simple and Clear Architecture**: AILERON Gateway architecture is very simple and therefor easy to understand.
- **Highly Customizable and Extensible**: To cover various use cases, AILERON Gateway is customizable and extensible.
- **Production Grade**: All features are well tested for stability.
- **Secure**: Security is prior to anything else.

## Implementation Principles

5 implementation principles are defined to give directions for developers.

- **Highly Customizable**: All features should be configurable as much as possible.
- **Usability First**: Think how the features are used. Make configuration intuitive.
- **Secure by Default**: All features should work secure by default.
- **Minimize Requirement**: Reduce requirements and make configurations simple.
- **Highly Decoupled**: Decouple the components and connect them with interfaces.

## AILERON Gateway Technology Landscape

To achieve our mission, AILERON Gateway leverages wide range of networking, APIs and cloud native technologies.
This landscape show the key technologies and specifications.

NOTE: Some features have not been implemented yet.

![landscape.svg](landscape.svg)

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

![reference-architecture.svg](reference-architecture.svg)

## References

- [Principles of Container-based Application Design](https://kubernetes.io/blog/2018/03/principles-of-container-app-design/)
