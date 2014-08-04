# stub out ActiveRecord so FilterByHash thinks it's defined
class ActiveRecord; end

require 'spec_helper'
require 'napa/active_record_extensions/filter_by_hash'
require 'active_support'
require 'napa_reserve/deprecations/filter_by_hash'

describe "Napa::FilterByHash Deprecation" do
  it 'raises a deprecation warning when mixed in to a class' do
    expect(ActiveSupport::Deprecation).to receive(:warn)
    class Foo; include Napa::FilterByHash; end
  end
end
