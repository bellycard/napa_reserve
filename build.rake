# This rake task can be hooked into the Travis build
# to run the specs as well as any other tasks, such as Cane
# this file could be included in Napa if that makes sense

require 'rspec/core/rake_task'
require 'cane/rake_task'
require 'napa/cane/deprecation_check'

desc "Run all build tasks"
task :build => [:spec, :quality]

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = "--color"
end

Cane::RakeTask.new(:quality) do |cane|
  cane.canefile = '.cane'
  cane.use DeprecationCheck, remote_deprecation: true
end

