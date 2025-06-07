---
title: Replacer
linkTitle: "🛠️Replacer"
type: docs
categories: ["reference"]
tags: []
description: ""
weight: 5020
params:
  ref: "main"
---

## Overview

**Replacer** は文字列の置換を行うリソースです。  
技術的には、`string` および `[]byte` の値を置換するための再利用可能なコンポーネントです。  
他のリソースから利用される再利用可能なリソースです。

たとえば、以下のような用途で使用されます：

- ログのマスキング（機密情報の隠蔽）
- ヘッダー値の変更
- ボディ内容の改変

定義済みの Replacer タイプは次の表にまとめられています。

| Replace type | Used method                                                             | Try on Go Playground                                                     |
| ------------ | ----------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| Noop         | -                                                                       | [https://go.dev/play/p/pEaudzyUeOX](https://go.dev/play/p/pEaudzyUeOX)   |
| Fixed        | -                                                                       | [https://go.dev/play/p/gIBOBblqe4w](https://go.dev/play/p/gIBOBblqe4w)   |
| Value        | [strings#ReplaceAll](https://pkg.go.dev/strings#ReplaceAll)             | [https://go.dev/play/p/Qz5wmj2MKca](https://go.dev/play/p/Qz5wmj2MKca)   |
| Left         | [strings#Repeat](https://pkg.go.dev/strings#Repeat)                     | [https://go.dev/play/p/\_XnzkUO5DNE](https://go.dev/play/p/_XnzkUO5DNE)  |
| Right        | [strings#Repeat](https://pkg.go.dev/strings#Repeat)                     | [https://go.dev/play/p/nDmuJ1F-TX2](https://go.dev/play/p/nDmuJ1F-TX2)   |
| Trim         | [strings#Trim](https://pkg.go.dev/strings#Trim)                         | [https://go.dev/play/p/p-O6aMuV_R0](https://go.dev/play/p/p-O6aMuV_R0)   |
| TrimLeft     | [strings#TrimLeft](https://pkg.go.dev/strings#TrimLeft)                 | [https://go.dev/play/p/8tSm5oex608](https://go.dev/play/p/8tSm5oex608)   |
| TrimRight    | [strings#TrimRight](https://pkg.go.dev/strings#TrimRight)               | [https://go.dev/play/p/xuH7DdM0yN_y](https://go.dev/play/p/xuH7DdM0yN_y) |
| TrimPrefix   | [strings#TrimPrefix](https://pkg.go.dev/strings#TrimPrefix)             | [https://go.dev/play/p/jhIFvHB8FoH](https://go.dev/play/p/jhIFvHB8FoH)   |
| TrimSuffix   | [strings#TrimSuffix](https://pkg.go.dev/strings#TrimSuffix)             | [https://go.dev/play/p/uY2WNAPlZ9M](https://go.dev/play/p/uY2WNAPlZ9M)   |
| Encode       | Regexp + Encode                                                         | [https://go.dev/play/p/yy1QvqHOjue](https://go.dev/play/p/yy1QvqHOjue)   |
| Hash         | Regexp + Hash                                                           | [https://go.dev/play/p/Hjc8Z2rR1wz](https://go.dev/play/p/Hjc8Z2rR1wz)   |
| Regexp       | [regexp#Regexp.ReplaceAll](https://pkg.go.dev/regexp#Regexp.ReplaceAll) | [https://go.dev/play/p/T6Mu9usjstw](https://go.dev/play/p/T6Mu9usjstw)   |
| Expand       | [regexp#Regexp.Expand](https://pkg.go.dev/regexp#Regexp.Expand)         | [https://go.dev/play/p/Pw6tLUVZYcO](https://go.dev/play/p/Pw6tLUVZYcO)   |
| Encrypt      | Regexp + Encryption                                                     | [https://go.dev/play/p/mBvv3DGInhg](https://go.dev/play/p/mBvv3DGInhg)   |

## Resource Definition

**Replacer** は [proto/kernel/replacer.proto]({{% github-url "proto/kernel/replacer.proto" %}}) に定義されています。  
これは、他のリソースのproto定義から参照されます。

```proto {linenos=inline}
{{% github-raw "proto/kernel/replacer.proto" %}}
```

## YAML Structure

```yaml
# Oneof
fixed: <object> # FixedReplacer
value: <object> # ValueReplacer
left: <object> # LeftReplacer
right: <object> # RightReplacer
trim: <object> # TrimReplacer
trimLeft: <object> # TrimLeftReplacer
trimRight: <object> # TrimRightReplacer
trimPrefix: <object> # TrimPrefixReplacer
trimSuffix: <object> # TrimSuffixReplacer
encode: <object> # EncodeReplacer
hash: <object> # HashReplacer
regexp: <object> # RegexpReplacer
expand: <object> # ExpandReplacer
encrypt: <object> # EncryptReplacer
hmac: <object> # HMACReplacer
```

## Examples
