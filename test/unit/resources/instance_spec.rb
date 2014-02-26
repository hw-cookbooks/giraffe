require_relative '../spec_helper'

describe "giraffe_instance resource" do
  let(:chef_run) do
    ChefSpec::Runner.new.converge("fixtures::giraffe_instance")
  end

  context "for create action" do
    it "sets all the attributes" do
      expect(chef_run).to create_giraffe_instance("create-full").with(
        path: "/somewhere/else",
        graphite_url: "http://example.com/stats",
        dashboards: [
          { name: "awesome", refresh: 600 },
          { name: "notascool", refresh: 1600 },
        ]
      )
    end

    it "enforces defaults" do
      expect(chef_run).to create_giraffe_instance("/tmp/yep").with(
        path: "/tmp/yep",
        graphite_url: nil,
        dashboards: []
      )
    end
  end

  context "for delete action" do
    it "deletes the instance" do
      expect(chef_run).to delete_giraffe_instance("/mnt/big")
    end
  end
end
