require 'rspec/core/rake_task'
require 'foodcritic'
require 'rubocop/rake_task'
require 'rake/clean'

FoodCritic::Rake::LintTask.new do |task|
  task.options = { fail_tags: ['any'], progress: true, context: true }
end

RuboCop::RakeTask.new do |task|
  task.options = %w(--display-cop-names --auto-correct)
end

test_results_dir = ENV['TEST_RESULTS_DIR'] || 'test_results'
CLOBBER.include(test_results_dir)

specfiles = 'test/****/*_spec.rb'

RSpec::Core::RakeTask.new(:spec) do |task|
  task.pattern = specfiles
  task.rspec_opts = "--require spec_helper --format documentation --format RspecJunitFormatter --out #{test_results_dir}/results.xml"
end

task :all do
  puts 'lets test this shit'
end

task build: [:all]
task default: [:foodcritic, :rubocop, :spec]
