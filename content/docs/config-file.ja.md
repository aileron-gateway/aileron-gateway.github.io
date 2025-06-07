---
title: Configファイル
linkTitle: Configファイル
type: docs
categories: []
tags: []
description: "About configuration file"
weight: 40
---

## APIs

AILERON Gateway は各機能を独立したリソースとして定義しています。  
リソースは以下の3つの属性で定義されます。  
このコンセプトは [Kubernetes](https://kubernetes.io/) から借用しています。  
詳しくは [Kubernetes API Concepts](https://kubernetes.io/docs/reference/using-api/api-concepts/) および [Objects In Kubernetes](https://kubernetes.io/docs/concepts/overview/working-with-objects/) を参照してください。

- `API Group`：APIグループ。例：`core`、`app`
- `API Version`：APIグループ内のバージョン。例：`v1`、`v1alpha1`、`v1beta1`
- `Kind`：リソースの種類。例：`Entrypoint`、`HTTPServer`

これらに加えて、リソースのインスタンスは `namespace` と `name` で識別されます。

結果として、すべてのリソースインスタンスは以下のようにユニークな識別子を持ちます。

`<API Group>/<API Version>/<Kind>/<Namespace>/<Name>`

AILERON Gatewayの文脈において、`API`はHTTPサーバーやミドルウェアなどのリソースの種類を指します。  
APIは、AILERON Gatewayの内部アーキテクチャで管理されています。

{{% image source="api.svg" %}}

## 設定フォーマット

すべてのリソースは以下の設定構造を持ちます。

```yaml
apiVersion:    <string> API group and version.
kind:          <string> API kind name.
metadata:      <object>
    namespace: <string> Namespace name for logical separation of this instances.
    name:      <string> Name of this instance. Unique in namespace.
spec:          <object> API specific configurations.
```

つまり、以下のような YAML がリソース定義の基本フォーマットとなります。

```yaml
apiVersion: <API Version>/<API Group>
kind: <Kind>
metadata:
  namespace: <Namespace>
  name: <Name>
spec: {}
```

設定ファイルは以下のフォーマットで、適切なファイル拡張子を持つ必要があります。  
マニフェストとして **yaml** と **json** フォーマットがサポートされています。  
AILERON Gatewayは起動時に指定されたマニフェストを読み込み、オブジェクトを生成します。

- `.yaml`：YAML形式の設定ファイル  
- `.yml`：YAML形式の設定ファイル  
- `.json`：JSON形式の設定ファイル  

例えば、以下のYAMLはHTTP サーバーを定義しています。

```yaml
apiVersion: core/v1
kind: HTTPServer
spec:
  addr: ":8080"
```

これは以下と同じ内容です。

```yaml
apiVersion: core/v1
kind: HTTPServer
metadata:
  namespace: default # 指定がなければ "default"
  name: default      # 指定がなければ "default"
spec:
  addr: ":8080"
```
