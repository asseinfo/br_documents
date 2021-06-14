require 'rspec/core/rake_task'
require 'bundler/gem_tasks'

task default: :spec
RSpec::Core::RakeTask.new

desc "Open an irb session preloaded class's"
task console: :enviroment do
  sh 'irb -rubygems -I lib -r br_documents.rb'
end
