require "bundler/gem_tasks"
require "rake/testtask"

namespace :test do
  Rake::TestTask.new(:all) do |t|
    t.libs << "test"
    t.test_files = FileList["test/**/*_test.rb"]
    t.verbose = true
  end
end

task default: 'test:all'
