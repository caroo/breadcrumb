# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "breadcrumb/version"

Gem::Specification.new do |s|
  s.name        = "breadcrumb"
  s.version     = Breadcrumb::VERSION
  s.authors     = ["pkw.de dev team"]
  s.email       = ["dev@pkw.de"]
  s.homepage    = ""
  s.summary     = %q{Generates breadcrumb markup}
  s.description = %q{Generates breadcrumb markup}


  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency "actionpack", '>= 3.0'
  s.add_dependency "railties", '>= 3.0'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'test-unit'
end
