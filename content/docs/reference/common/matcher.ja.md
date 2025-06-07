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

Matcher は文字列マッチングのためのリソースです。  
技術的には、`string` および `[]byte` に対するマッチング機能を提供する再利用可能なコンポーネントです。  
これは他のリソースから利用される再利用可能なリソースです。

次のような用途で使用されます：

- パスのマッチング
- ヘッダー値のマッチング
- ボディ内容のマッチング

定義済みのマッチタイプは以下の表に示します。

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

Matcher は [proto/kernel/matcher.proto]({{% github-url "proto/kernel/matcher.proto" %}}) に定義されています。  
このリソースは他のリソースの proto から参照されます。

```proto {linenos=inline}
{{% github-raw "proto/kernel/matcher.proto" %}}
```

## YAML Structure

```yaml
patterns: <[]string>
matchType: <enum>
```

## Examples

### Exact

`Exact` は完全一致のマッチングを行います。
`==`　演算子によって評価されます。

例:

```yaml
matchType: Exact
patterns: ["foo", "bar"]
```

- 一致： "foo", "bar"
- 不一致： "baz", "FOO"

### Prefix

`Prefix` は接頭語（プレフィックス）でのマッチングを行います。
値は [strings#HasPrefix](https://pkg.go.dev/strings#HasPrefix) によって評価されます。

例:

```yaml
matchType: Prefix
patterns: ["foo", "bar"]
```

- 一致： "foo", "fooBar", "barBaz"
- 不一致： "baz", "FOOBAR"

### Suffix

`Suffix` は接尾語（サフィックス）でのマッチングを行います。
値は [strings#HasSuffix](https://pkg.go.dev/strings#HasSuffix) によって評価されます。

例:

```yaml
matchType: Suffix
patterns: ["foo", "bar"]
```

- 一致： "foo", "barfoo", "bazbar"
- 不一致： "Foo", "fooBar"

### Contains

`Contains` は部分一致（含む）マッチングを行います。
値は [strings#Contains](https://pkg.go.dev/strings#Contains) によって評価されます。

例:

```yaml
matchType: Contains
patterns: ["foo", "bar"]
```

- 一致： "foo", "barfoo", "bazbar"
- 不一致： "Foo", "BAR", "baz"

### Path

`Path` provides path matching.
値は [path#Match](https://pkg.go.dev/path#Match) によって評価されます。

例:

```yaml
matchType: Path
patterns: ["foo/*", "bar/[0-9]?"]
```

- 一致： "foo/", "foo/bar", "bar/1"
- 不一致： "foo/bar/baz", "foo", "bar/baz"

### FilePath

`FilePath` provides filepath matching.
値は [filepath#Match](https://pkg.go.dev/path/filepath#Match) によって評価されます。

例:

```yaml
matchType: FilePath
patterns: ["foo/*", "bar/[0-9]?"]
```

- 一致： "foo/", "foo/bar", "bar/1"
- 不一致： "foo/bar/baz", "foo", "bar/baz"

### Regex

`Regex` provides regular expression matching.
値は [regexp#Regexp.Match](https://pkg.go.dev/regexp#Regexp.Match) によって評価されます。

例:

```yaml
matchType: Regex
patterns: ["foo.*", "(bar|BAR)"]
```

- 一致： "foo", "bazfoobaz", "aliceBARbob"
- 不一致： "FOO", "fo", "Bar"

※ 行頭や行末を指定したい場合は `^` や `$` を使用してください。

詳しい構文は [regexp/syntax](https://pkg.go.dev/regexp/syntax) を参照してください。

### RegexPOSIX

`RegexPOSIX` provides regular expression in POSIX matching.
値はPOSIX表記の正規表現としてパースされた [regexp#Regexp.Match](https://pkg.go.dev/regexp#Regexp.Match) によって評価されます。

例:

```yaml
matchType: RegexPOSIX
patterns: ["foo.*", "(bar|BAR)"]
```

- 一致： "foo", "bazfoobaz", "aliceBARbob"
- 不一致： "FOO", "fo", "Bar"

※ 行頭や行末を指定したい場合は `^` や `$` を使用してください。

詳しい構文は [regexp/syntax](https://pkg.go.dev/regexp/syntax) を参照してください。
