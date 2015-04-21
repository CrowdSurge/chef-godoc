#
# Cookbook Name:: godoc
# Recipe:: default
#
# Copyright (C) 2014 CrowdSurge
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "golang::default"
include_recipe "runit::default"

if node['godoc']['nginx']['proxy']
  include_recipe "godoc::nginx-proxy"
end

user node["godoc"]["user"] do
  action :create
  comment "Godoc User"
  home node["godoc"]["home"]
  shell "/bin/bash"
  supports :manage_home => true
end

runit_service "godoc" do
  options({
    :user => node["godoc"]["user"]
  })
end
