# <a name="title"></a> Giraffe Chef Cookbook

## <a name="description"></a> Description

Chef cookbook for [Giraffe][giraffe], a graphite dashboard with a long neck.

* Website: http://hw-cookbooks.github.io/giraffe/
* Source Code: https://github.com/hw-cookbooks/giraffe
* IRC Help: [Freenode#heavywater][irc_hw]

## <a name="usage"></a> Usage

This cookbook provides a Giraffe provider which for you to include in your recipes. The Giraffe provider installs and configures the Giraffe application. You will need to configure a webserver to serve the application.


## <a name="requirements"></a> Requirements

### <a name="requirements-chef"></a> Chef

Tested on 11.10.4 but newer and older versions (of 11) should work just fine.
File an [issue][issues] if this isn't the case.

### <a name="requirements-platform"></a> Platform

The following platforms have been tested with this cookbook, meaning that the
recipes run on these platforms without error:

* ubuntu (12.04)
* centos (6.4)

Please [report][issues] any additional platforms so they can be added.

### <a name="requirements-cookbooks"></a> Cookbooks

This cookbook depends on the following external cookbooks:

* [git][cb_git]

## <a name="recipes"></a> Recipes

### <a name="recipes-default"></a> default

This recipe installs git, a prerequisite for installing giraffe.

## <a name="attributes"></a> Attributes

* `node[:giraffe][:revision]` - git reference (tag/branch/commit) to checkout (defaults to `"1.1.0"`)
* `node[:giraffe][:repository]` - uri of git repository to checkout (defaults to `"https://github.com/kenhub/giraffe.git"`)

## <a name="lwrps"></a> Resources and Providers

### <a name="giraffe_instance"></a> giraffe\_instance

### <a name="lwrps-giraffe_instance-actions"></a> Actions

| Action | Description	                                      | Default |
|--------|----------------------------------------------------|---------|
| create | Installs Giraffe via git, configures dashboards.js | Yes     |

### <a name="lwrps-giraffe_instance-vault-attributes"></a> Attributes

| Attribute | Description               | Default Value |
|-------------------|-----------------------------------------------------------------------|---------------------|
| path              | **Name attribute:** The path for the Giraffe installation.            | `nil`               |
| graphite_url      | The url of the Graphite server for the Giraffe instance to use.       | `nil`               |
| dashbords         | An array of configuration hashes which represent dashboards.          | `[]`                |
| git_repository    | The git repository hosting Giraffe source code.                       | `nil`               |
| git_revision      | The git revision specifying the revision of Giraffe code to checkout. | `nil`               |
| template_cookbook | The cookbook to use when specifying a dashboards.js template.         | `giraffe`           |
| template_source   | The name of the dashboards.js template file in the template_cookbook. | `dashboards.js.erb` |

#### <a name="giraffe_instance-examples"></a> Examples

    giraffe_instance "/srv/www/giraffe" do
      graphite_url "http://127.0.0.1"
      dashboards [
        {
          :name => "test",
          :refresh => 5000,
          :description => "test dashboard",
          :metrics => [
            {
              :alias =>  "test",
              :target => "metrics.test.tests",
              :description => "Example metric",
              :summary => "sum",
              :summary_formatter => "d3.format(\",f\")"
            }
          ]
        }
      ]
    end

## <a name="development"></a> Development

* Source hosted at [GitHub][repo]
* Report issues/Questions/Feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make.

## <a name="license"></a> License and Author

Author:: [Heavy Water Operations][hw]

Copyright 2011, 2012, 2013, 2014 Heavy Water Operations, LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[cb_git]:       http://community.opscode.com/cookbooks/git
[irc_hw]:       http://webchat.freenode.net/?channels=heavywater
[giraffe]:      https://github.com/kenhub/giraffe

[hw]:           http://hw-ops.com
[repo]:         https://github.com/hw-cookbooks/giraffe
[issues]:       https://github.com/hw-cookbooks/giraffe/issues