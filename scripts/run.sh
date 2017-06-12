#!/usr/bin/env bash
# bundle install

# Delete generated site
rm -r _site

# Needed to run github-pages in unsafe code for jekyll-pdf
export DISABLE_WHITELIST=true
bundle exec jekyll serve --incremental --verbose
