[![Taylor Swift](https://img.shields.io/badge/secured%20by-taylor%20swift-brightgreen.svg)](https://twitter.com/SwiftOnSecurity)
[![Volkswagen](https://auchenberg.github.io/volkswagen/volkswargen_ci.svg?v=1)](https://github.com/auchenberg/volkswagen)
[![Build Status](https://travis-ci.org/katallaxie/mesos-jenkins.svg?branch=master)](https://travis-ci.org/katallaxie/mesos-jenkins)

# Mesos Jenkins Docker

## Quick Start

```
# clone the repo
# --depth 1 removes all but one .git commit history
git clone --depth 1 https://github.com/katallaxie/mesos-jenkins.git

# change to repo folder
cd mesos-jenkins

# build docker
docker build -t mesos-jenkins .

# run
docker run --rm -p 8080:8080 mesos-jenkins
```

# License
[MIT](/LICENSE)