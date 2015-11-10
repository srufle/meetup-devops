#
# Cookbook Name:: example_cookbook
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt'

package 'vim'

template '/home/vagrant/.vimrc' do
  source 'vimrc.erb'
  variables(
    color: node['example']['vim']['color']
  )
end
