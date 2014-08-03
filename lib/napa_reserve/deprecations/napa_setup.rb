module Napa
  class Deprecations
    def self.napa_setup_check
      required_patterns = [
        /require 'bundler\/setup'/,
        /Bundler.setup(:default)/,
        /require 'napa\/setup'/,
        /Bundler.require(:default, Napa.env.to_sym)/,
        /require 'napa'/,
        /Dotenv.load(Napa.env.test? ? '.env.test' : '.env')/,
        "Dir['./config/initializers/**/*.rb'].map { |file| require file }",
        "Dir['./config/middleware/**/*.rb'].map { |file| require file }",
        /relative_load_paths = %w(app\/apis app\/entities app\/models app\/workers app\/representers lib)/,
        /ActiveSupport::Dependencies.autoload_paths += relative_load_paths/
      ]

      expired_patterns = [
        /require 'dotenv'/,
        "RACK_ENV = ENV['RACK_ENV']",
        "if RACK_ENV == 'test'",
        /Dotenv.load(".env.test")/,
        /Bundler.require :default, RACK_ENV/,
        /require 'will_paginate'/,
        /require 'will_paginate\/active_record'/
      ]

      required_patterns_regex = Regexp.union(required_patterns)
      expired_patterns_regex = Regexp.union(expired_patterns)

      if File.exists?('./app.rb')
        if File.readlines('./app.rb').grep(expired_patterns_regex).any? || !File.readlines('./app.rb').grep(required_patterns_regex).any?
          ActiveSupport::Deprecation.warn 'app.rb is out of date, please update your configuration', caller
        end
      end
    end
  end
end
