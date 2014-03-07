#
# Cookbook Name:: giraffe
# Provider:: instance
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
#

def whyrun_supported?
  true
end

use_inline_resources

action :create do
  d = directory ::File.dirname(new_resource.path) do
    recursive true
    action :create
  end
  new_resource.updated_by_last_action(d.updated_by_last_action?)

  g = git new_resource.path do
    repository new_resource.git_repository || node['giraffe']['git_repository'] 
    revision new_resource.git_revision || node['giraffe']['git_revision']
    depth 1
    action :sync
  end
  new_resource.updated_by_last_action(g.updated_by_last_action?)

  t = template ::File.join(new_resource.path, "dashboards.js") do
    cookbook new_resource.template_cookbook
    source new_resource.template_source
    variables({
      graphite_url: new_resource.graphite_url,
      dashboards: JSON.pretty_generate(new_resource.dashboards),
    })
    action :create
  end
  new_resource.updated_by_last_action(t.updated_by_last_action?)
end

action :delete do
end
