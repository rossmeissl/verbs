# frozen_string_literal: true

require 'rubygems'

begin
  require 'bundler'
rescue LoadError
  warn 'You must install bundler - run `gem install bundler`'
end

begin
  Bundler.setup
rescue Bundler::BundlerError => e
  warn e.message
  warn 'Run `bundle install` to install missing gems'
  exit e.status_code
end

require 'rake'
require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end
task default: :test
