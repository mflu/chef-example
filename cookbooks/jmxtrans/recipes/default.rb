#
# Cookbook Name:: jmxtrans
# Recipe:: default
#
# Copyright 2011, realityforge
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

remote_file "#{Chef::Config[:file_cache_path]}/jmxtrans_250-1_all.deb" do
  source "http://jmxtrans.googlecode.com/files/jmxtrans_250-1_all.deb"
  mode 0644
end


bash "dpkg install" do
  code <<-EOH
    dpkg -i #{Chef::Config[:file_cache_path]}/jmxtrans_250-1_all.deb
  EOH
end
