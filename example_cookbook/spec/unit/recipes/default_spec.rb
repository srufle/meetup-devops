#
# Cookbook Name:: example_cookbook
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'example_cookbook::default' do
  context 'setting up vim' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.node.set['example']['vim']['color'] = 'elflord'
      runner.converge(described_recipe)
    end

    it 'installs vim' do
      expect(chef_run).to install_package('vim')
    end

    it 'updates .vimrc' do
      expect(chef_run).to create_template('/home/vagrant/.vimrc')
      expect(chef_run).to render_file('/home/vagrant/.vimrc').with_content(':color elflord')
    end
  end
end
