#
# Cookbook Name:: pulse
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.


#include_recipe 'mysql::server'
#include_recipe 'java'
include_recipe 'pulse::db-server'
include_recipe 'pulse::app-server'
include_recipe 'pulse::web-server'
