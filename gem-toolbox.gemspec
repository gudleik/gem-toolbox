# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name        = "gem-toolbox"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY

  s.authors     = ["Gudleik Rasch"]
  s.email       = ["gudleik@gmail.com"]
  s.homepage    = "http://github.com/gudleik/gem-toolbox"
  s.summary     = "Gem toolbox"
  s.description = "Plugins for RubyGems"

  s.files       = Dir.glob("{lib}/**/*") + %w(README.rdoc CHANGES.md) 

  s.extra_rdoc_files  = [ "README.rdoc" ]
  s.rdoc_options      = ["--charset=UTF-8"]
  s.require_paths     = ["lib"]
  s.rubygems_version  = "1.3.7"
  
  # s.add_development_dependency "rspec"
  # s.test_files = [
  #   "spec/spec_helper.rb",
  #   "spec/application_spec.rb",
  #   "spec/mailbox_spec.rb"
  # ]
  
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  
end