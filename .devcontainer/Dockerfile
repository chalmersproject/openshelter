# [Choice] Ruby version (use -bullseye variants on local arm64/Apple Silicon):
# 3, 3.0, 2, 2.7, 2.6, 3-bullseye, 3.0-bullseye, 2-bullseye, 2.7-bullseye,
# 2.6-bullseye, 3-buster, 3.0-buster, 2-buster, 2.7-buster, 2.6-buster
ARG VARIANT=3-bullseye
FROM mcr.microsoft.com/vscode/devcontainers/ruby:0-${VARIANT}

# Install Rails
RUN gem install rails webdrivers

# Install Postgres
RUN echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    sh -c "wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -" && \
    apt-get update && \
    apt-get -y install postgresql-client-14

# Install watchman
RUN apt-get -y install watchman

# Default value to allow debug server to serve content over GitHub Codespace's
# port forwarding service.
#
# The value is a comma-separated list of allowed domains.
ENV RAILS_DEVELOPMENT_HOSTS=".githubpreview.dev"

# [Choice] Node.js version: lts/*, 16, 14, 12, 10
ARG NODE_VERSION="16"
RUN zsh -c "source /usr/local/share/nvm/nvm.sh && nvm install $NODE_VERSION 2>&1"

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# [Optional] Uncomment this line to install additional gems.
# RUN gem install <your-gem-names-here>

# [Optional] Uncomment this line to install global node packages.
# RUN su vscode -c "source /usr/local/share/nvm/nvm.sh && npm install -g <your-package-here>" 2>&1

# Disable RVM and NVM
RUN /usr/local/rvm/bin/rvm-shell -c "rvm implode --force" && \
    rm /usr/local/share/nvm/nvm.sh /usr/local/share/nvm/bash_completion

# Install yarn completions
RUN yarn global add yarn-completions

# Use zsh
COPY .devcontainer/.zshrc /root/.zshrc.append
RUN cat ~/.zshrc.append >> ~/.zshrc && chsh -s /bin/zsh
