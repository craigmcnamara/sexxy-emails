require 'rubygems'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.test_files = FileList['test/sexxy_emails/**/*.rb', 'test/test_helper.rb']
  t.verbose = true
end

task :default => 'test'
