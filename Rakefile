require "bundler/gem_tasks"
require "rake/testtask"

desc 'run all tests'
Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
  t.verbose = true
end

desc 'run kindle_highlights console'
task :console do
  exec 'pry -I lib -r kindle_highlights'
end

task default: :test
