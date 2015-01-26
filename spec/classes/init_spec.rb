require 'spec_helper'
describe 'websvn' do

  context 'with defaults for all parameters' do
    it { should contain_class('websvn') }
  end
end
