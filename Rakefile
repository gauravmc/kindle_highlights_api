require "bundler/gem_tasks"
require "rake/testtask"

desc 'run all tests'
Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"].exclude(/integration/)
end

desc 'run all integration tests'
Rake::TestTask.new(:integration) do |t|
  t.libs << "test"
  t.test_files = FileList["test/integration/*_test.rb"]
end

desc 'run kindle_highlights_api console'
task :console do
  exec 'pry -I lib -r kindle_highlights_api'
end

task default: :test
