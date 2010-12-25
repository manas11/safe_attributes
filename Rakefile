require 'rubygems'
require 'bundler'
begin 
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "safe_attributes"
  gem.homepage = "http://github.com/bjones/safe_attributes"
  gem.license = "MIT"
  gem.summary = %Q{Add support reserved word column names with ActiveRecord}
  gem.description = %Q{If your schema has columns named type, or class, or any other name that conflicts with a method of ActiveRecord or one of its superclasses, you will need this gem to use Rails 3 with that database.}
  gem.email = "cbj@gnu.org"
  gem.authors = ["Brian Jones"]
  gem.add_development_dependency "rspec", ">= 2.0.0"
  gem.add_development_dependency "sqlite3-ruby"
  gem.add_dependency "activerecord", ">= 3.0.0"
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "SafeAttributes #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
