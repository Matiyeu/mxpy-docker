# mxpy cli for Docker

Non-official [mx-sdk-py-cli](https://github.com/multiversx/mx-sdk-py-cli) for Docker

## Usage

### For Gitlab CI:

```
image: matiyeu/mxpy

stages:
  - build

build:
  stage: build
  script:
    - mxpy contract build
  artifacts:
    paths:
      - output/*
    name: sc-output
```

