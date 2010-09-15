require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/breadcrumb'

Hoe.plugin :newgem
# delete broken Hoe plugins
Hoe.plugins.delete :rubyforge
Hoe.plugins.delete :test

# Generate all the Rake tasks
# Run 'rake -T' to see list of generated tasks (from gem root directory)
$hoe = Hoe.spec 'breadcrumb' do
  self.developer 'Caroo GmbH Development', 'dev@pkw.de'
  self.extra_deps         = [['activesupport', "~> 2.3"],['actionpack', "~> 2.3"]]
  self.extra_dev_deps     = [['test-unit']]
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }

# use rake test task instead of the broken hoe plugin
desc "Run unit tests"
Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.ruby_opts << "-rubygems"
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
  t.warning = true
end
# set default task to test
task :default => [:test]
