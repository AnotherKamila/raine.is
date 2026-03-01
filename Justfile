_default:
    @just --list --unsorted

build: install
    @bundle exec jekyll build

serve: install
    @bundle exec jekyll serve --livereload
    
install:
    @bundle install
    
check-data:
    cd _data && just check-all