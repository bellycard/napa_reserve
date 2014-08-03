module Napa
  module FilterByHash
    def self.included(base)
      ActiveSupport::Deprecation.warn 'Napa::FilterByHash is deprecated, this module will be removed in future releases', caller
      base.extend(ClassMethods)
    end
  end
end
