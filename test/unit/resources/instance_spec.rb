require_relative '../spec_helper'

describe "giraffe_instance resource" do
  let(:chef_run) do
    ChefSpec::Runner.new{|node|
      node.set['giraffe']['git_repository'] = "node_repo"
      node.set['giraffe']['git_revision'] = "node_revision"
    }.converge("fixtures::giraffe_instance")
  end

  context "for create action" do
    it "sets all the attributes" do
      expect(chef_run).to create_giraffe_instance("create-full").with(
        path: "/somewhere/else",
        graphite_url: "http://example.com/stats",
        dashboards: [
          { name: "awesome", refresh: 600 },
          { name: "notascool", refresh: 1600 },
        ],
        git_repository: "a-git-repo",
        git_revision: "a-version",
        template_cookbook: "giraffe_wrapper",
        template_source: "my-custom-dashboards.js.erb"
      )
    end

    it "enforces defaults" do
      expect(chef_run).to create_giraffe_instance("/tmp/yep").with(
        path: "/tmp/yep",
        graphite_url: nil,
        dashboards: [],
        git_repository: nil,
        git_revision: nil,
        template_cookbook: "giraffe",
        template_source: "dashboards.js.erb"
      )
    end
  end

  context "for delete action" do
    it "deletes the instance" do
      expect(chef_run).to delete_giraffe_instance("/mnt/big")
    end
  end
end
