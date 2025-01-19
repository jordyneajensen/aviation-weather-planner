# Pin npm packages by running ./bin/importmap

pin "application", to: "application.js"
pin "application" # @0.1.4
# config/importmap.rb
pin "@rails/ujs", to: "https://ga.jspm.io/npm:@rails/ujs@7.0.4/lib/assets/compiled/rails-ujs.js"

