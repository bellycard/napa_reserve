# This class will be used to bootstrap the process of downloading
# and processing all of the deprecation checks from the github repo
# Right now it only does one contained check, but it can easily be
# expanded upon

class DeprecationCheck < Struct.new(:opts)
  def self.options
    { :remote_deprecation => ["Pull Deprecation Checks from Github"] }
  end

  def violations
    violations = []

    unless napa_current_version?
      violations << {
        description: "Napa Version Out of Date",
        label: "Please run: bundle update napa"
      }
    end

    return violations
  end

  def napa_current_version?
    lockfile      = Cane::File.iterator('Gemfile.lock')
    napa_entries  = lockfile.map{ |line| line.strip if line.downcase.include?('napa') }.compact
    napa_entries.select{|e| e == 'napa (0.2.1)'}.any?
  end
end