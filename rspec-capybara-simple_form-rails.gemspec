# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec-capybara-simple_form/rails/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-capybara-simple_form-rails"
  spec.version       = Rspec::Capybara::SimpleForm::Rails::VERSION
  spec.authors       = ["dei79"]
  spec.email         = ["dirk.eisenberg@gmail.com"]
  spec.description   = %q{A simple gem which contains a couple of matches for capybara and simpelform tests}
  spec.summary       = %q{A simple gem which contains a couple of matches for capybara and simpelform tests}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
