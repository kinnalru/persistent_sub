# -*- encoding: utf-8 -*-
# frozen_string_literal: true
$:.push File.expand_path("../lib", __FILE__)
require "persistent_sub/version"

Gem::Specification.new do |spec|
  spec.name        = 'persistent_sub'
  spec.version     = PersistentSub::VERSION
  spec.authors     = ['Samoilenko Yuri']
  spec.email       = ['kinnalru@gmail.com']
  spec.homepage    = 'https://github.com/kaminari/kaminari'
  spec.summary     = 'Internal pub/sub subsystem stored in DB'
  spec.description = 'Kaminari is a Scope & Engine based, clean, powerful, agnostic, customizable and sophisticated paginator for Rails 4+'
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_runtime_dependency "activerecord"
 
  spec.add_development_dependency 'bundler', '>= 1.0.0'
  spec.add_development_dependency 'rake', '>= 0'
end
