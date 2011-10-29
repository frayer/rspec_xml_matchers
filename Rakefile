require 'rake/testtask'
require 'rspec/core/rake_task'

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

task :default => [:test, :spec]