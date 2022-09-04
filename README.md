# chalmersproject.com

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
