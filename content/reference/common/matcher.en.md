---
title: Matcher
linkTitle: "🛠️Matcher"
type: docs
categories: ["reference"]
tags: []
description: ""
weight: 5010
params:
  ref: "main"
---

## Overview

Matcher is a string matcher resource.
Technically speaking, it is a reusable component that provides `string` and `[]byte` matching.
It it a reusable resource that is used from other resources.

It is used as, for example,

- path matching
- header value matching
- body content matchin

Defined matcher types are listed in the table.

| Match type | Used method                                                   | Try on Go Playground                                                   |
| ---------- | ------------------------------------------------------------- | ---------------------------------------------------------------------- |
| Exact      | ==                                                            | [https://go.dev/play/p/tzXNQYFeEbm](https://go.dev/play/p/tzXNQYFeEbm) |
| Prefix     | [strings#HasPrefix](https://pkg.go.dev/strings#HasPrefix)     | [https://go.dev/play/p/f_eU7-K49ZV](https://go.dev/play/p/f_eU7-K49ZV) |
| Suffix     | [strings#HasSuffix](https://pkg.go.dev/strings#HasSuffix)     | [https://go.dev/play/p/dOpLnzu74nv](https://go.dev/play/p/dOpLnzu74nv) |
| Contains   | [strings#Contains](https://pkg.go.dev/strings#Contains)       | [https://go.dev/play/p/tbFRqJTL7vt](https://go.dev/play/p/tbFRqJTL7vt) |
| Path       | [path#Match](https://pkg.go.dev/path#Match)                   | [https://go.dev/play/p/xY56ZBgCGrO](https://go.dev/play/p/xY56ZBgCGrO) |
| FilePath   | [filepath#Match](https://pkg.go.dev/path/filepath#Match)      | [https://go.dev/play/p/dHl5dof11ZF](https://go.dev/play/p/dHl5dof11ZF) |
| Regex      | [regexp#Regexp.Match](https://pkg.go.dev/regexp#Regexp.Match) | [https://go.dev/play/p/AjWEC9C_YIh](https://go.dev/play/p/AjWEC9C_YIh) |
| RegexPOSIX | [regexp#Regexp.Match](https://pkg.go.dev/regexp#Regexp.Match) | [https://go.dev/play/p/yP1LIgg0PAe](https://go.dev/play/p/yP1LIgg0PAe) |

## Resource Definition

Matcher is defined in the [proto/kernel/matcher.proto]({{% github-url "proto/kernel/matcher.proto" %}}).
It is referred from other resource protos.

```proto {linenos=inline}
{{% github-raw "proto/kernel/matcher.proto" %}}
```

## YAML Structure

```yaml
patterns: <[]string>
matchType: <enum>  # MatchType: Exact, Prefix, Suffix, Contains, Path, FilePath, Regex, RegexPOSIX
```

## Examples

### Exact

`Exact` provides exact matching.
Values are evaluated by `==` operator.

For example:

```yaml
matchType: Exact
patterns: ["foo", "bar"]
```

- Match: "foo", "bar"
- Not match: "baz", "FOO"

### Prefix

`Prefix` provides prefix matching.
Values are evaluated by [strings#HasPrefix](https://pkg.go.dev/strings#HasPrefix).

For example:

```yaml
matchType: Prefix
patterns: ["foo", "bar"]
```

- Match: "foo", "fooBar", "barBaz"
- Not match: "baz", "FOOBAR"

### Suffix

`Suffix` provides suffix matching.
Values are evaluated by [strings#HasSuffix](https://pkg.go.dev/strings#HasSuffix).

For example:

```yaml
matchType: Suffix
patterns: ["foo", "bar"]
```

- Match: "foo", "barfoo", "bazbar"
- Not match: "Foo", "fooBar"

### Contains

`Contains` provides containing matching.
Values are evaluated by [strings#Contains](https://pkg.go.dev/strings#Contains).

For example:

```yaml
matchType: Contains
patterns: ["foo", "bar"]
```

- Match: "foo", "barfoo", "bazbar"
- Not match: "Foo", "BAR", "baz"

### Path

`Path` provides path matching.
Values are evaluated by [path#Match](https://pkg.go.dev/path#Match).

For example:

```yaml
matchType: Path
patterns: ["foo/*", "bar/[0-9]?"]
```

- Match: "foo/", "foo/bar", "bar/1"
- Not match: "foo/bar/baz", "foo", "bar/baz"

### FilePath

`FilePath` provides filepath matching.
Values are evaluated by [filepath#Match](https://pkg.go.dev/path/filepath#Match).

For example:

```yaml
matchType: FilePath
patterns: ["foo/*", "bar/[0-9]?"]
```

- Match: "foo/", "foo/bar", "bar/1"
- Not match: "foo/bar/baz", "foo", "bar/baz"

### Regex

`Regex` provides regular expression matching.
Values are evaluated by [regexp#Regexp.Match](https://pkg.go.dev/regexp#Regexp.Match).

For example:

```yaml
matchType: Regex
patterns: ["foo.*", "(bar|BAR)"]
```

- Match: "foo", "bazfoobaz", "aliceBARbob"
- Not match: "FOO", "fo", "Bar"

Note: Use `^` and `$` to represents line starting and ending.

See the documentation of [regexp/syntax](https://pkg.go.dev/regexp/syntax) for details about syntax.

### RegexPOSIX

`RegexPOSIX` provides regular expression in POSIX matching.
Values are evaluated by [regexp#Regexp.Match](https://pkg.go.dev/regexp#Regexp.Match)
and the expressions are parsed by following POSIX rule.

For example:

```yaml
matchType: RegexPOSIX
patterns: ["foo.*", "(bar|BAR)"]
```

- Match: "foo", "bazfoobaz", "aliceBARbob"
- Not match: "FOO", "fo", "Bar"

Note: Use `^` and `$` to represents line starting and ending.

See the documentation of [regexp/syntax](https://pkg.go.dev/regexp/syntax) for details about syntax.
