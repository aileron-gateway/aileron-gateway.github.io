# AILERON Gateway Website

This repository contains resources for **[https://aileron-gateway.github.io/](https://aileron-gateway.github.io/)**.

See the [contributing instruction](https://aileron-gateway.github.io/community/contributing/website/) when developing the website.

## Run website locally

**Prerequisites.**

- Install [Hugo extended edition](https://gohugo.io/installation/).
- Install [Dart Sass](https://gohugo.io/functions/css/sass/#dart-sass).
- Install [Node.js](https://nodejs.org/en/download).

**Clone and install npm packages.**

- `git clone --recursive https://github.com/aileron-gateway/aileron-gateway.github.io.git`
- `cd aileron-gateway.github.io`
- `npm install`
- `cd themes/docsy/ && npm install`
- `cd ../../`
- `hugo server -D`
