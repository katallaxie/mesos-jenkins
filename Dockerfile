FROM jenkins:2.60.1

ARG LIBMESOS=https://downloads.mesosphere.com/libmesos-bundle/libmesos-bundle-1.9-argus-1.1.x-3.tar.gz
ARG LIBMESOS_SHA=6f5468dd8fb8a2cd84fef950ab945bfafaa405edffa5c62fdc1a475e9f86b4ef
ARG BLUEOCEAN=1.1.4

USER root


RUN export TMP="$(mktemp -d)" && cd $TMP \
    && curl -fsSL "$LIBMESOS" -o libmesos-bundle.tar.gz  \
    && echo "$LIBMESOS_SHA libmesos-bundle.tar.gz" | sha256sum -c - \
    && tar -C / -xzf libmesos-bundle.tar.gz  \
    && rm -rf $TMP

RUN /usr/local/bin/install-plugins.sh   \
  blueocean-commons:${BLUEOCEAN}        \
  blueocean-config:${BLUEOCEAN}          \
  blueocean-dashboard:${BLUEOCEAN}      \
  blueocean-events:${BLUEOCEAN}         \
  blueocean-git-pipeline:${BLUEOCEAN}           \
  blueocean-github-pipeline:${BLUEOCEAN}        \
  blueocean-i18n:${BLUEOCEAN}           \
  blueocean-jwt:${BLUEOCEAN}            \
  blueocean-personalization:${BLUEOCEAN}        \
  blueocean-pipeline-api-impl:${BLUEOCEAN}      \
  blueocean-rest-impl:${BLUEOCEAN}      \
  blueocean-rest:${BLUEOCEAN}           \
  blueocean-web:${BLUEOCEAN}            \
  blueocean:${BLUEOCEAN}                \
  ant:1.5                        \
  ace-editor:1.1                 \
  ansicolor:0.5.0                \
  antisamy-markup-formatter:1.5  \
  authentication-tokens:1.3      \
  branch-api:2.0.10              \
  build-name-setter:1.6.5        \
  build-timeout:1.18             \
  cloudbees-folder:6.0.4         \
  conditional-buildstep:1.3.5    \
  config-file-provider:2.15.7      \
  copyartifact:1.38.1            \
  docker-build-publish:1.3.2     \
  docker-workflow:1.12            \
  durable-task:1.14              \
  ec2:1.36                       \
  embeddable-build-status:1.9    \
  external-monitor-job:1.7       \
  ghprb:1.39.0                   \
  git:3.3.2                      \
  git-client:2.4.6               \
  git-server:1.7                 \
  github:1.27.0                  \
  github-api:1.85.1              \
  github-branch-source:2.0.8     \
  github-organization-folder:1.6 \
  gradle:1.27.1                  \
  greenballs:1.15                \
  handlebars:1.1.1               \
  ivy:1.27.1                     \
  jackson2-api:2.7.3             \
  job-dsl:1.64                   \
  jobConfigHistory:2.16          \
  jquery:1.11.2-0                \
  ldap:1.16                      \
  mapdb-api:1.0.9.0              \
  marathon:1.5.0                 \
  matrix-auth:1.7                \
  matrix-project:1.11            \
  maven-plugin:2.15.1            \
  mesos:0.14.1                   \
  metrics:3.1.2.9                \
  momentjs:1.1.1                 \
  monitoring:1.68.1              \
  nant:1.4.3                     \
  node-iterator-api:1.5.0        \
  pam-auth:1.3                   \
  parameterized-trigger:2.35     \
  pipeline-build-step:2.5.1      \
  pipeline-github-lib:1.0        \
  pipeline-input-step:2.7        \
  pipeline-milestone-step:1.3.1  \
  pipeline-model-definition:1.1.8 \
  pipeline-rest-api:2.8          \
  pipeline-stage-step:2.2        \
  pipeline-stage-view:2.8        \
  plain-credentials:1.4          \
  rebuild:1.25                   \
  role-strategy:2.5.1            \
  run-condition:1.0              \
  s3:0.10.12                     \
  saferestart:0.3                \
  saml:0.14                      \
  scm-api:2.1.1                  \
  ssh-agent:1.15                 \
  ssh-slaves:1.20                \
  subversion:2.9                 \
  timestamper:1.8.8              \
  translation:1.15               \
  variant:1.1                    \
  windows-slaves:1.3.1           \
  workflow-aggregator:2.5        \
  workflow-api:2.17              \
  workflow-basic-steps:2.6       \
  workflow-cps:2.36.1            \
  workflow-cps-global-lib:2.8    \
  workflow-durable-task-step:2.12 \
  workflow-job:2.12              \
  workflow-multibranch:2.16      \
  workflow-scm-step:2.6          \
  workflow-step-api:2.12         \
  workflow-support:2.14

RUN echo 'networkaddress.cache.ttl=60' >> ${JAVA_HOME}/jre/lib/security/java.security \
    && echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state