---
title: Unixドメインソケットを利用する
linkTitle: Unix Socket
type: docs
---

{{% alert title="Info" color="info" %}}
This page is being prepared.
{{% /alert %}}


### Use Unix socket

```yaml
network: "unix"
addr: "/var/run/gateway.sock"
```

```bash
curl --unix-socket "/var/run/gateway.sock" http://dummy.com/test
```

```yaml
network: "unix"
addr: "@gateway"
```

```bash
curl --abstract-unix-socket "gateway" http://dummy.com/test
```
