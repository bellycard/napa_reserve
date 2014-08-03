require 'git'
require 'napa'
require 'napa_reserve/deploy'

Dotenv.load(Napa.env.test? ? '.env.test' : '.env')

module Napa
  class CLI
    class Base < Thor
      desc 'deploy [target]', 'Deploys A Service to a given target (i.e. production, staging, etc.)'
      method_options :force => :boolean, :revision => :string
      def deploy(environment)
        if yes?('Are you sure you want to deploy this service?', Thor::Shell::Color::YELLOW)
          deploy = NapaReserve::Deploy.new(environment, force: options[:force], revision: options[:revision])
          if deploy.deployable?
            say(deploy.deploy!, Thor::Shell::Color::GREEN)
          else
            say("Deploy Failed:\n#{deploy.errors.join("\n")}", Thor::Shell::Color::RED)
          end
        end
      end
    end
  end
end
