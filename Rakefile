require 'rake/testtask'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = ['spec/**/*_spec.rb', 'spec_examples/**/*_spec.rb']
end

task :default => [:spec]