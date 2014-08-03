cane_notes
==========

This doc is a placeholder for what will eventually become a tool that hooks into Travis and reports warnings about code issues with Napa services. These code issues might be things like: running an old version of Napa or maybe some other convention that has changed. These checks will evolve over time, so this repo will be the place where the checks are maintained and versioned.

#### .cane.example
```
--style-measure 200
--abc-max 30
--no-doc
```

#### build.rake
```ruby
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

```

#### deprecation_check.rb
```ruby
# This class will be used to bootstrap the process of downloading
# and processing all of the deprecation checks from the github repo
# Right now it only does one contained check, but it can easily be
# expanded upon

class DeprecationCheck < Struct.new(:opts)
  def self.options
    { remote_deprecation: ['Pull Deprecation Checks from Github'] }
  end

  def violations
    violations = []

    unless napa_current_version?
      violations << {
        description: 'Napa Version Out of Date',
        label: 'Please run: bundle update napa'
      }
    end

    violations
  end

  def napa_current_version?
    lockfile      = Cane::File.iterator('Gemfile.lock')
    napa_entries  = lockfile.map { |line| line.strip if line.downcase.include?('napa') }.compact
    napa_entries.select { |e| e == 'napa (0.2.1)' }.any?
  end
end

```