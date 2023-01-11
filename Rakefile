# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

begin
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

desc 'Run rubocop'
task :rubocop do
  RuboCop::RakeTask.new
end
