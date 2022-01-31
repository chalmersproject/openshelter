# Use Ruby 3 on Bullseye.
FROM mcr.microsoft.com/vscode/devcontainers/ruby:0-3-bullseye

# Install Postgres.
RUN echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    sh -c "wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -" && \
    apt-get update && \
    apt-get -y install postgresql-client-14

# Install Ngnix and Tmux.
RUN apt-get -y install nginx tmux

# Install Overmind.
RUN curl -Lo /usr/local/bin/overmind.gz https://github.com/DarthSim/overmind/releases/download/v2.2.2/overmind-v2.2.2-linux-amd64.gz && \
    gzip -d /usr/local/bin/overmind.gz && \
    chmod u+x /usr/local/bin/overmind

# Install Node 16.
RUN zsh -c "source /usr/local/share/nvm/nvm.sh && nvm install 16 2>&1"

# Disable RVM and NVM (to improve shell performance).
RUN /usr/local/rvm/bin/rvm-shell -c "rvm implode --force" && \
    rm /usr/local/share/nvm/nvm.sh /usr/local/share/nvm/bash_completion

# Install Yarn completions for zsh.
# TODO: This doesn't seem to work!
#
# RUN git clone https://github.com/buonomo/yarn-completion /root/.oh-my-zsh/custom/plugins/yarn-completion

# Default value to allow debug server to serve content over GitHub Codespace's
# port forwarding service.
#
# The value is a comma-separated list of allowed domains.
ENV RAILS_DEVELOPMENT_HOSTS=".githubpreview.dev"

# Configure zsh as default shell.
COPY .devcontainer/.zshrc /root/.zshrc.append
RUN cat ~/.zshrc.append >> ~/.zshrc && \
    chsh -s /bin/zsh && \
    zsh -c "source /root/.zshrc && omz update"
