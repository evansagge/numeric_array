require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "numeric_array"
    gem.summary = %Q{Extension methods for manipulating and calculating an array of numbers}
    gem.description = %Q{Support for Array#sum, Array#mean, Array#variance, Array#standard_deviation. An ArgumentError is raised when at least one array element is non-numeric.}
    gem.email = "evansagge@gmail.com"
    gem.homepage = "http://github.com/evansagge/numeric_array"
    gem.authors = ["Evan Sagge"]
    gem.add_development_dependency "rspec", ">= 2.0.0.beta.20"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end


require 'rspec/core'
require 'rspec/core/rake_task'

task :default => :spec

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = "./spec/**/*_spec.rb"
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = "./spec/**/*_spec.rb"
  spec.rcov = true
end

task :spec => :check_dependencies

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "mongoid-rspec #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end