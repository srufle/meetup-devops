require 'spec_helper'

# Verifies that vim is installed on the machine
describe package('vim') do
  it 'vim should be_installed' do
    should be_installed
  end
end