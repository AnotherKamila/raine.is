_default:
    @just --list --unsorted

build: setup
    bundle exec jekyll build

serve: setup
    bundle exec jekyll serve --livereload
    
setup:
    bundle setup
    
check-data:
    cd _data && just check-all