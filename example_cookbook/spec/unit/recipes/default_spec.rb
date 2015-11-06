#
# Cookbook Name:: example_cookbook
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'example_cookbook::default' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end
    
    it 'installs vim' do
      expect(chef_run).to install_package('vim')
    end
    
    it 'updates .vimrc' do
      expect(chef_run).to render_file('/home/vagrant/.vimrc').with_content(':color desert')
    end
  end
end
