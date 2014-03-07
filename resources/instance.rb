#
# Cookbook Name:: giraffe
# Resource:: instance
#
# Copyright 2014, Heavy Water Software Inc.
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

actions :create, :delete
default_action :create

attribute :path, :kind_of => String, :name_attribute => true
attribute :graphite_url, :kind_of => [String, NilClass]
attribute :dashboards, :kind_of => Array, :default => []
attribute :git_repository, :kind_of => String
attribute :git_revision, :kind_of => String
attribute :template_cookbook, :kind_of => String, :default => "giraffe"
attribute :template_source, :kind_of => String, :default => "dashboards.js.erb"
