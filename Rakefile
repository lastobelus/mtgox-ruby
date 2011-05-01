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
  gem.name = "mtgox-ruby"
  gem.homepage = "http://github.com/paulasmuth/mtgox-ruby"
  gem.license = "MIT"
  gem.summary = "ruby client for the mtgox.com bitcoin exchange api"
  gem.description = "trade bitcoins from ruby"
  gem.email = "paul@23linesofcode.com"
  gem.authors = ["Paul Asmuth"]
  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec'
require 'rspec/core/rake_task'
desc "Run all examples"
RSpec::Core::RakeTask.new('spec') do |spec|
  spec.pattern = 'spec/*_spec.rb'
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "mtgox-ruby #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
