# Rakefile
require 'rake'
require 'rake/clean'
require 'rake/testtask'
require 'tempfile'
require 'open3'

task { :default => :test }
task { :test => 'test:all' }

namespace 'test' do
  Rake::TestTask.new('all') do |t|
    t.libs << 'test'
    t.test_files = FileList['test/test_*.rb']
  end
end
