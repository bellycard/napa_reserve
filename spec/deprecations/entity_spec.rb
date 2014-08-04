# stub out some classes to setup the test
module Napa; end
class Napa::Entity; end
class Grape; end
class Grape::Entity; end

require 'spec_helper'
require 'active_support'
require 'napa_reserve/deprecations/entity'

describe "Napa::Entity Deprecation" do
  it 'raises a deprecation warning when a class inherits' do
    expect(ActiveSupport::Deprecation).to receive(:warn)
    class Foo < Napa::Entity; end
  end
end
