_default:
    @just --list --unsorted

# Build the site
build: setup check-data
    bundle exec jekyll build

# jekyll serve, with livereload
serve: setup check-data
    bundle exec jekyll serve --livereload
    
# Install dependencies
setup:
    bundle config set --local path '.bundle'
    bundle install
    
# Validate data files
check-data:
    cd _data && just check-all
