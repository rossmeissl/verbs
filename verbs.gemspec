# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'verbs/version'

Gem::Specification.new do |s|
  s.name = 'verbs'
  s.version = Verbs::VERSION
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.4.0'
  s.authors = ['Andy Rossmeissl']
  s.description = 'Conjugates most common english verbs for all persons, tenses, standard aspects, and modern moods (with active diathesis). Standard and exceptional spelling rules are obeyed.'
  s.summary = 'English verb conjugation in Ruby'
  s.email = 'andy@rossmeissl.net'
  s.homepage = 'http://github.com/rossmeissl/verbs'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'rake'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'test-unit'
  s.add_dependency 'activesupport', '>= 2.3.4'
  s.add_dependency 'i18n'
end
