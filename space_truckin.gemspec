Gem::Specification.new do |s|
  s.name        = "space_truckin"
  s.version     = "0.1.0"
  s.author      = "Mark Sim"
  s.email       = "mark@quarternotecoda.com"
  s.homepage    = "http://github.com/marksim/s8-e2"
  s.summary     = "Space Truckin' Engine."
  s.description = "Game inspired by Ticket to Ride and Steam... in SPAAAACCEEE."

  s.files        = Dir["{lib,spec}/**/*", "[A-Z]*", "init.rb"] - ["Gemfile.lock"]
  s.require_path = "lib"

  s.add_development_dependency 'rspec', '~> 2.1.0'
  s.add_development_dependency 'guard-rspec', '~> 0.4.0'

  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.4"
end