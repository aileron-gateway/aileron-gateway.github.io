---
title: Website
linkTitle: Website
type: docs
categories: ["contributing"]
tags: []
description: ""
weight: 10
---

## Overview

This page describes how to get started with updating [documentation site](https://aileron-gateway.github.io/), this site.

GitHub repository for the website is [aileron-gateway.github.io](https://github.com/aileron-gateway/aileron-gateway.github.io).

Required tools are:

- [Hugo Extended Version Dart Sass](https://gohugo.io/installation/)
- [Dart Sass](https://gohugo.io/functions/css/sass/#dart-sass) (required by Hugo)
- [Node.js with npm](https://nodejs.org/en/download)

## Setup development environment

### 1. Install [Hugo](https://gohugo.io/)

**Follow the instruction: [Installation](https://gohugo.io/installation/).**

Make sure to install `extended edition`.

This is an example to install extended version of hugo.

```bash
export HUGO_VERSION=0.147.5
wget -O hugo.deb https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.deb
sudo dpkg -i hugo.deb
```

Once installation is completed, check `hugo` command is available.

```bash
$ hugo version
hugo v0.147.5-7766fc62416ff95ed7768c19947ac0fcd96444cc+extended linux/amd64 BuildDate=2025-05-22T11:37:19Z VendorInfo=gohugoio
```

### 2. Install [Dart Sass](https://sass-lang.com/dart-sass/)

**Follow the instruction: [Dart Sass](https://gohugo.io/functions/css/sass/#dart-sass) or [Install Sass](https://sass-lang.com/install/).**

### 3. Install [Node.js](https://nodejs.org/en/download)

**Follow the instruction: [Download Node.js®](https://nodejs.org/en/download).**

Check that `npm` command is available.
You can check it by running `npm -v`.

```bash
$ npm -v
10.2.4
```

## Run website locally

Clone the repository and install npm packages.

```bash
git clone --recursive  https://github.com/aileron-gateway/aileron-gateway.github.io.git
cd aileron-gateway.github.io
npm install
cd themes/docsy/ && npm install
```

Then go back to the repository root and run the command.
It will serve the website locally.

```bash
hugo server -D
```
