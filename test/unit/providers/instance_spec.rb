require_relative '../spec_helper'

describe "giraffe_instance provider" do
  let(:chef_run) do
    ChefSpec::Runner.new(step_into: ["giraffe_instance"]).
      converge("fixtures::giraffe_instance")
  end

  context "for create action" do

    it "creates a parent directory" do
      expect(chef_run).to create_directory("/somewhere").with(
        recursive: true
      )
    end

    it "clones the library with git" do
      expect(chef_run).to sync_git("/somewhere/else").with(
        repository: "https://github.com/kenhub/giraffe.git",
        revision: "1.1.0",
        depth: 1,
      )
    end

    it "renders a template for dashboards.js" do
      expect(chef_run).to create_template("/somewhere/else/dashboards.js").with(
        cookbook: "giraffe",
        source: "dashboards.js.erb",
      )
    end

    it "renders the dashboard.js file" do
      expect(chef_run).to render_file("/somewhere/else/dashboards.js").
        with_content(%r{graphite_url = "http://example.com/stats";}).
        with_content(%r{"awesome"})
    end
  end

  context "for delete action" do
  end
end

