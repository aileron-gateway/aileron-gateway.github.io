---
title: Foo
linkTitle: Foo
identifier: Foo
type: docs
categories: []
tags: []
description: ""
weight: 5
---

Foo

```go
package main

import (
  "io"
  "log"
  "net/http"
)

func main() {
  // Hello world, the web server

  helloHandler := func(w http.ResponseWriter, req *http.Request) {
    io.WriteString(w, "Hello, world!\n")
  }

  http.HandleFunc("/hello", helloHandler)
  log.Fatal(http.ListenAndServe(":8080", nil))
}
```

```yaml
markup:
  goldmark:
    parser:
      attribute:
        block: true
    renderer:
      unsafe: true
  highlight:
    # See a complete list of available styles at https://xyproto.github.io/splash/docs/all.html
    style: tango
    # Uncomment if you want your chosen highlight style used for code blocks without a specified language
    # guessSyntax: true

```

```html
<!doctype html>
<html lang="{{ .Site.Language.Lang }}" class="no-js">
  <head>
    {{ partial "head.html" . }}
  </head>
  <body class="td-{{ .Kind }}">
    <header>
      {{ partial "navbar.html" . }}
    </header>
    <div class="container-fluid td-default td-outer">
      <main role="main" class="td-main">
        {{ block "main" . }}{{ end }}
      </main>
      {{ partial "footer.html" . }}
    </div>
    {{ partialCached "scripts.html" . }}
  </body>
</html>
```