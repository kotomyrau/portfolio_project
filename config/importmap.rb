# config/importmap.rb

pin "application", to: "application.js"

# Turbo + Stimulus
pin "@hotwired/turbo", to: "@hotwired--turbo.js" # @8.0.13
pin "@hotwired/turbo-rails", to: "@hotwired--turbo-rails.js", preload: true
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true

# Your controllers
pin_all_from "app/javascript/controllers", under: "controllers"
pin "controllers/application", to: "controllers/application.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
