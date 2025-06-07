---
title: Website
linkTitle: Website
type: docs
categories: ["contributing"]
tags: []
description: ""
weight: 10
---

## 概要

このページでは、[ドキュメントサイト](https://aileron-gateway.github.io/)（このサイト）をアップデートする方法について説明します。

このサイトのGitHubリポジトリは[aileron-gateway.github.io](https://github.com/aileron-gateway/aileron-gateway.github.io)です。

必要なツールは以下の通りです：

- [Hugo Extended Version Dart Sass](https://gohugo.io/installation/)
- [Dart Sass](https://gohugo.io/functions/css/sass/#dart-sass) (required by Hugo)
- [Node.js with npm](https://nodejs.org/en/download)

## 開発環境のセットアップ

### 1. [Hugo](https://gohugo.io/) をインストール

**手順はこちらを参照してください：[インストール](https://gohugo.io/installation/)。**

必ず`extended edition`をインストールしてください。

以下はHugoのextendedバージョンをインストールする例です。

```bash
export HUGO_VERSION=0.147.5
wget -O hugo.deb https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.deb
sudo dpkg -i hugo.deb
```

インストールが完了したら、`hugo` コマンドが使用可能か確認してください。

```bash
$ hugo version
hugo v0.147.5-7766fc62416ff95ed7768c19947ac0fcd96444cc+extended linux/amd64 BuildDate=2025-05-22T11:37:19Z VendorInfo=gohugoio
```

### 2. [Dart Sass](https://sass-lang.com/dart-sass/) をインストール

**手順はこちらを参照してください：[Dart Sass](https://gohugo.io/functions/css/sass/#dart-sass) または [Sass のインストール](https://sass-lang.com/install/)。**

### 3. [Node.js](https://nodejs.org/en/download) をインストール

**手順はこちらを参照してください：[Node.js® ダウンロード](https://nodejs.org/en/download)。**

`npm` コマンドが使用可能か確認してください。  
`npm -v`コマンドでバージョンを確認できます：

```bash
$ npm -v
10.2.4
```

## ローカルでウェブサイトを実行する

リポジトリをクローンし、npm パッケージをインストールします。

```bash
git clone --recursive  https://github.com/aileron-gateway/aileron-gateway.github.io.git
cd aileron-gateway.github.io
npm install
cd themes/docsy/ && npm install
```

リポジトリのルートに戻り、以下のコマンドを実行します。
これによりローカルでウェブサイトが起動します。

```bash
hugo server -D
```
