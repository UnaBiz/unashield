#!/usr/bin/env bash
# bundle install

cp ../patch/generator.rb /usr/local/lib/ruby/gems/2.4.0/gems/jekyll-pdf-0.1.6/lib/jekyll/pdf/
cp /mnt/c/Temp/document.rb /usr/local/lib/ruby/gems/2.4.0/gems/jekyll-pdf-0.1.6/lib/jekyll/pdf/

# Delete generated site
#rm -r _site

# Needed to run github-pages in unsafe code for jekyll-pdf
export DISABLE_WHITELIST=true
bundle exec jekyll build --verbose --trace
