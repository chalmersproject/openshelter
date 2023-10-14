# openshelter

_Fighting homelessness in Toronto, Ontario._

## TODO

- [ ] Update @prettier/ruby-plugin to v3 when
      https://github.com/prettier/plugin-ruby/issues/1264 is fixed.
- [ ] Add basic testing
- [ ] Ensure that user confirmation doesn't auto-trigger when hovering over
      link in email client
- [ ] Report slow queries to Honeybadger using: https://github.com/kirillshevch/query_track
- [ ] Remove AlpineJS
- [ ] Asynchronously initialize Mapbox (see application layout)

## Development
### iOS
```bash
# Install required tools (OSX):
brew install rbenv ruby-build  # rbenv is a Ruby version manager
brew install volta             # volta is a Node version manager
brew install overmind          # overmind is a procfile runner
brew install --cask docker     # docker builds and runs containers

# Set up system for development:
bin/setup

# Run server for development:
bin/dev
open http://localhost:3000 # run in separate terminal to open application server

# Start development tools (optional):
open http://localhost:3000/internal/letter_opener # show emails sent in development
open http://localhost:3000/internal/good_job # show jobs dashboard
open http://localhost:1080 # show emails caught by MailCatcher
docker compose up -d pgweb && open http://localhost:8081 # Postgres UI
docker commpose up -d kibana && open http://localhost:5601 # Kibana (ElasticSearch UI)

# Attach to Rails server for debugging:
bin/attach # detach with "ctrl-b d"; scroll with "ctrl-b ["

# Format code:
bin/fmt [--check] <targets>

# Lint code:
bin/lint [--check] <targets>

# Generate Ruby typings for gems:
bin/tapioca gem <name>

# Generate Ruby typings for application:
bin/tapioca dsl

# Annotate models:
bin/annotate

# Show TODOs/FIXMEs/NOTEs, etc:
bin/rails notes

# Show routes:
bin/rails routes
```

### Windows

To setup a development environment on windows, you'll clone the repo into a unix instance through WSL and run everything from there.

**(The following presumes that you're running a Windows 11 machine connected to an instance of Ubuntu version 22.04 running through WSL)**

#### Prerequisites - Windows

- [WSL](https://learn.microsoft.com/en-us/windows/wsl/install)
- [Docker](https://www.docker.com/)
  - Connect docker to run on your WSL Instance by following the instructions [here](https://learn.microsoft.com/en-us/windows/wsl/tutorials/wsl-containers)

##### Prerequisites - Ubuntu 22.04

After installing and configuring your Ubuntu instance, ensure that you have the following dependencies installed before cloning the repository! If you're going through these one at a time, probably restart your wsl instance after every installing every major dependency.

- Ruby
  -  Install the [ruby version manager](https://rvm.io/rvm/install)
  - Ubuntu-22.04 comes with a later version of openssl that the ruby version used by this project isn't compatible with. Install openssl version 1.1.1 and install ruby 3.1.2-Follow the instructions in the most upvoted answer to [this stackoverflow question](https://stackoverflow.com/questions/74882078/rvm-error-when-installing-ruby-using-wsl2-on-ubuntu-error-running-rvm-make)
- NPM and Yarn
  - Install [NVM](https://github.com/nvm-sh/nvm), use node version 16
    - `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash`
    - `nvm install latest`
    - `nvm use 16`
  - Use corepack that comes with node to install yarn
    - `corepack enable yarn`
    - `corepack install yarn -g`
    - `corepack prepare yarn@stable --activate`
- Postgresql
  - Install [postgresql](https://ubuntu.com/server/docs/databases-postgresql)
  - Configure it
    - Modify `/etc/postgresql/*/main/postgresql.conf` to listen on all addresses
      - Set `listen_addresses = '*'`
    - Create a password for the default postgres user
      - `sudo -u postgres psql template1`
      - `ALTER USER postgres with encrypted password '<your password>';`
    - Restart postgresql service
      - `sudo systemctl restart postgresql.service`
  - Install libpq-dev
    - `sudo apt-get -y install libpq-dev`

  - Install postgis
    - `sudo apt install postgis`

  - Ensure that the user that you will be using to login to postgres with has the following role attributes: `Superuser, Create role, Create DB, Replication, Bypass RLS`
- Go
  - Install the [Go version manager](https://github.com/moovweb/gvm)
    - Install the version of Go that overmind needs using gvm. Note the [section](https://github.com/moovweb/gvm#to-install-go-120) of the install guide for go versions > 1.20. Install 1.4 and then 1.17.3 and then the version overmind will use
    - Install [overmind](https://github.com/DarthSim/overmind)

- [Tmux](https://github.com/tmux/tmux/wiki/Installing)
  - `sudo apt install tmux`

- [Redis Server](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-ubuntu-22-04)
  - Follow the instructions!


After you've cloned the repository run `bin/setup` and `bin/dev` in the root of the repository. To test, try connecting to 'http://localhost:3000' to see if the webserver loads the site correctly.

Then you can run bin/rails db:seed to populate the database with default data for the locations of the shelters.


