---
title: アーキテクチャ
linkTitle: アーキテクチャ
type: docs
categories: []
tags: []
description: ""
weight: 20
---

## 単一バイナリ・単一コンフィグ

[Go](https://go.dev/)により、AILERON Gateway は単一かつスタンドアロンのバイナリとしてビルドされています。  
実行環境に環境に依存は不要です。
これにより、AILERON Gatewayは非常にポータブルで実行が簡単です。  
コントロールプレーンやデータベースも不要です。

必要なのは **単一のバイナリと単一の設定ファイル** だけです。

実行もとても簡単です。

```bash
aileron -f /path/to/config
```

機能の使い方については、[Getting Started](/docs/getting-started/) ガイドをご覧ください。

## サーバー／クライアント アーキテクチャ

AILERON GatewayはGoアプリケーションの典型的なHTTPサーバーとクライアントのアーキテクチャを採用しています。

以下の図は基本的なネットワークプロトコルのレイヤーを示しています。  
AILERON Gatewayはサーバーとクライアントの枠内に示されたすべてのプロトコルをサポートすることを目指しています。

{{% image source="networks.svg" %}}

サーバー側には主に`Middleware`と`Handler`の2つのコンポーネントがあります。  
`Middleware`は他の言語でフィルターやインターセプターと呼ばれることもあり、HTTPリクエストに対して中間処理を提供します。
`Handler`はAPIリクエストに対する最終処理を提供します。  
すべてのクライアントリクエストはMiddlewareとHandlerの組み合わせで処理されます。

Middlewareは複数のHandlerで共有可能です。  
`Mux`（マルチプレクサ）はAPIリクエストを適切なHandlerに振り分けます。

- Middleware の例  
  - ロギング Middleware  
  - タイムアウト Middleware  
  - スロットル Middleware  
  - CORS Middleware  
  - CSRF Middleware  
  - 認証 Middleware  
  - 認可 Middleware  
- Handler の例  
  - リバースプロキシ Handler  
  - スタティック Handler（静的ファイルサーバー）  
  - テンプレート Handler（テンプレートからのレスポンスコンテンツ）

以下の図は AILERON Gateway における HTTP サーバーのアーキテクチャを示しています。  
HTTPサーバーは仮想ホストをサポートします。  
Mux、Middleware、Handler はそれぞれ独自のインターフェースを持ちます。

{{% image source="http-server.svg" %}}

クライアント側には `Tripperware` と `RoundTripper` の2つの主要なコンポーネントがあります。  
`Tripperware`はクライアント側のMiddlewareで、HTTP クライアントに対する中間処理を提供します。  
`RoundTripper`はHTTPクライアント自体で、HTTP クライアントに対する最終処理を提供します。

- Tripperware の例  
  - ロギング  
  - リトライ  
  - トレーシング  

以下の図は AILERON Gateway における HTTP クライアントのアーキテクチャを示しています。

{{% image source="http-client.svg" %}}

## 実行

AILERON Gatewayは[Go](https://go.dev/)で書かれているため、  
バイナリのエントリポイントは [Go 言語仕様](https://go.dev/ref/spec#Program_execution) に記載されている通り `main()`関数です。

AILERON Gateway の main 関数は [cmd/aileron/aileron.go](https://github.com/aileron-gateway/aileron-gateway/blob/main/cmd/aileron/aileron.go) に記述されています。

```go
func main(){
  // Starting up the AILERON Gateway.
}
```

main 関数に入ると、AILERON Gateway は [ライフサイクル](#ライフサイクル) に記載されたライフサイクルで起動します。

## ライフサイクル

`main()` 関数に入ると、AILERON Gateway は以下の処理を開始します。

簡単に説明すると、

- コマンドライン引数を処理する
- 設定ファイルを読み込み、処理する
- エントリポイントリソースを実行する（＝HTTPサーバーを起動する）

{{% image source="lifecycle.svg" %}}

`Entrypoint` リソースはアプリケーションのエントリポイントです。
このリソースは任意の `Runner` リソースを実行できます。
Runner リソースとは、以下のランナーインターフェースを実装したリソースのことです。
HTTPサーバーはこの種類の典型的なリソースです。

```go
type Runner interface {
  Run(context.Context) error
}
```

この図は、main関数がランナーを呼び出し、OSのシグナルがmainからランナーへ伝播される様子を示しています。  
HTTPサーバーはシグナルを受け取るとシャットダウンされます。

{{% image source="process-tree.svg" %}}
