# frozen_string_literal: true

require_relative "lib/tiny_utils/version"

Gem::Specification.new do |s|
  s.name        = %q(tiny_utils)
  s.version     = TinyUtils::VERSION
  s.date        = %q(2020-03-28)
  s.authors     = ["Johnny Benson"]
  s.email       = ["johnnybenson@gmail.com"]
  s.homepage    = "https://github.com/johnnybenson/tiny-utils"
  s.summary     = "TinyUtils are tiny utils"
  s.description = "Functions that we no longer copy/paste!"
  s.license     = "MIT"
  s.files       = Dir["lib/**/*.rb", "LICENSE", "README.md"]

  s.add_runtime_dependency 'rails', '~> 6.0.2', '>= 6.0.2.2'
  s.add_runtime_dependency 'hashids', '~> 1.0'

  s.add_development_dependency "rspec", '~> 3.8'
  s.add_development_dependency "rubocop", '~> 0.76'
  s.add_development_dependency "rubocop-airbnb", '~> 3.0'
end
