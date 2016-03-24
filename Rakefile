require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.name = "test" 
  t.libs << "test"
  #t.libs << "lib"
  t.test_files = Dir['test/*test*.rb']
  t.verbose  = true
end

task :default => :spec
  