module NapaReserve
  class Initializer
    def self.run
      Napa::Logger.logger.info NapaReserve::GemDependency.log_all
    end
  end
end
