$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mng_lead_capture/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mng_lead_capture"
  s.version     = MNGLeadCapture::VERSION
  s.authors     = ["Cezar Halmagean"]
  s.email       = ["cezar@halmagean.ro"]
  s.homepage    = "https://github.com/mixandgo/mng_lead_capture"
  s.summary     = "Ruby on Rails lead capture engine"
  s.description = "A small lead capture engine that you can plug into an existing Ruby on Rails application and get a ready to use signup form + admin section + emailing capabilities"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.1.5"
  s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails', "~> 3.1.0"
  s.add_development_dependency 'factory_girl_rails', "~> 4.0"
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'capybara-email'
  s.add_development_dependency 'cucumber-rails'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'email_spec'
  s.add_development_dependency 'selenium-webdriver'
end
