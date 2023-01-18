# syntax = docker/dockerfile:experimental

# Dockerfile used to build a deployable image for a Rails application.
# Adjust as required.
#
# Common adjustments you may need to make over time:
#  * Modify version numbers for Ruby, Bundler, and other products.
#  * Add library packages needed at build time for your gems, node modules.
#  * Add deployment packages needed by your application
#  * Add (often fake) secrets needed to compile your assets

#######################################################################

# Learn more about the chosen Ruby stack, Fullstaq Ruby, here:
#   https://github.com/evilmartians/fullstaq-ruby-docker.
#
# We recommend using the highest patch level for better security and
# performance.

# Declare arguments, with default values.
ARG NODE_VERSION=16
ARG YARN_VERSION=1.22.17
# ARG POSTGRES_VERSION=14
ARG OVERMIND_VERSION=2.2.2

ARG RUBY_VERSION=3.1.2
ARG VARIANT=jemalloc-slim
FROM quay.io/evl.ms/fullstaq-ruby:${RUBY_VERSION}-${VARIANT} as base

# Re-declare arguments, since they are reset by the FROM instrucitons.
# Learn more about the chosen Ruby stack, Fullstaq Ruby, here:
#   https://github.com/evilmartians/fullstaq-ruby-docker.
#
# See: https://github.com/moby/moby/issues/34129
ARG DISTRO_NAME
ARG RUBY_VERSION
ARG NODE_VERSION
ARG YARN_VERSION
ARG POSTGRES_VERSION
ARG OVERMIND_VERSION
# Install common dependencies.
RUN apt-get update -qq \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends build-essential gnupg2 curl less git \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && truncate -s 0 /var/log/*log

# Install NodeJS and Yarn.
RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash -
RUN apt-get update -qq \
    && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends nodejs \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && truncate -s 0 /var/log/*log
RUN npm install -g yarn@$YARN_VERSION

# Install Overmind.
RUN curl -Lo /usr/local/bin/overmind.gz https://github.com/DarthSim/overmind/releases/download/v$OVERMIND_VERSION/overmind-v$OVERMIND_VERSION-linux-amd64.gz \
    && gzip -d /usr/local/bin/overmind.gz \
    && chmod u+x /usr/local/bin/overmind

# Install system dependencies and utils.
COPY Aptfile /tmp/Aptfile
RUN apt-get update -qq \
    && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends $(grep -Ev '^\s*#' /tmp/Aptfile | xargs) \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && truncate -s 0 /var/log/*log

# Install Starship.
COPY starship.toml /root/.config/starship.toml
RUN curl -sS https://starship.rs/install.sh | sh -s -- --yes

# Configure shell.
COPY .zshrc /tmp/.zshrc
RUN echo >> ~/.zshrc \
    && cat /tmp/.zshrc >> ~/.zshrc \
    && chsh -s /bin/zsh \
    && rm -rf /tmp/*
# Configure environment.
ENV RAILS_ENV=production RAILS_LOG_TO_STDOUT=true
# Configure exposed ports.
EXPOSE 3000
# Configure healthcheck.
HEALTHCHECK --interval=10s --timeout=1s --start-period=15s --retries=3 CMD curl -f http://${HOST}:${PORT}/internal/status || exit 1

LABEL fly_launch_runtime="rails"

ARG BUNDLER_VERSION=2.3.12

ARG RAILS_ENV=production
ENV RAILS_ENV=${RAILS_ENV}

ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true

ARG BUNDLE_WITHOUT=development:test
ARG BUNDLE_PATH=vendor/bundle
ENV BUNDLE_PATH ${BUNDLE_PATH}
ENV BUNDLE_WITHOUT ${BUNDLE_WITHOUT}

RUN mkdir /app
WORKDIR /app
RUN mkdir -p tmp/pids

RUN gem update --system --no-document && \
    gem install -N bundler -v ${BUNDLER_VERSION}

#######################################################################

# install packages only needed at build time

FROM base as build_deps

ARG BUILD_PACKAGES="git build-essential libpq-dev wget vim curl gzip xz-utils libsqlite3-dev"
ENV BUILD_PACKAGES ${BUILD_PACKAGES}

RUN --mount=type=cache,id=dev-apt-cache,sharing=locked,target=/var/cache/apt \
    --mount=type=cache,id=dev-apt-lib,sharing=locked,target=/var/lib/apt \
    apt-get update -qq && \
    apt-get install --no-install-recommends -y ${BUILD_PACKAGES} \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives

#######################################################################

# install gems

FROM build_deps as gems

COPY Gemfile* ./
RUN bundle install && rm -rf vendor/bundle/ruby/*/cache

#######################################################################

# install deployment packages

FROM base

ARG DEPLOY_PACKAGES="postgresql-client file vim curl gzip libsqlite3-0"
ENV DEPLOY_PACKAGES=${DEPLOY_PACKAGES}

RUN --mount=type=cache,id=prod-apt-cache,sharing=locked,target=/var/cache/apt \
    --mount=type=cache,id=prod-apt-lib,sharing=locked,target=/var/lib/apt \
    apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    ${DEPLOY_PACKAGES} \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives

# copy installed gems
COPY --from=gems /app /app
COPY --from=gems /usr/lib/fullstaq-ruby/versions /usr/lib/fullstaq-ruby/versions
COPY --from=gems /usr/local/bundle /usr/local/bundle

#######################################################################

# Deploy your application
COPY . .

# Adjust binstubs to run on Linux and set current working directory
RUN chmod +x /app/bin/* && \
    sed -i 's/ruby.exe\r*/ruby/' /app/bin/* && \
    sed -i 's/ruby\r*/ruby/' /app/bin/* && \
    sed -i '/^#!/aDir.chdir File.expand_path("..", __dir__)' /app/bin/*

# The following enable assets to precompile on the build server.  Adjust
# as necessary.  If no combination works for you, see:
# https://fly.io/docs/rails/getting-started/existing/#access-to-environment-variables-at-build-time
ENV SECRET_KEY_BASE 1
# ENV AWS_ACCESS_KEY_ID=1
# ENV AWS_SECRET_ACCESS_KEY=1

# Run build task defined in lib/tasks/fly.rake
ARG BUILD_COMMAND="bin/rails fly:build"
RUN ${BUILD_COMMAND}

# Default server start instructions.  Generally Overridden by fly.toml.
ENV PORT 8080
ARG SERVER_COMMAND="bin/rails fly:server"
ENV SERVER_COMMAND ${SERVER_COMMAND}
CMD ${SERVER_COMMAND}
