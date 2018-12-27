# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_errors/version'

Gem::Specification.new do |spec|
  spec.name = 'active_errors'
  spec.version = ActiveErrors::VERSION
  spec.authors = ['Juan Gomez']
  spec.email = ['j.gomez@drexed.com']

  spec.summary = 'Gem for commonly used ruby object helpers.'
  spec.description = 'Class extensions of commonly used ruby object helpers.'
  spec.homepage = 'http://drexed.github.io/active_errors'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'activerecord'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'database_cleaner'
  spec.add_development_dependency 'fasterer'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'reek'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'sqlite3'
end
