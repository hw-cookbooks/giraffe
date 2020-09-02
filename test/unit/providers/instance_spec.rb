require_relative '../spec_helper'

describe 'giraffe_instance provider' do
  let(:chef_run) do
    ChefSpec::Runner.new(step_into: ['giraffe_instance']) do |node|
      node.set['giraffe']['git_repository'] = 'node_repo'
      node.set['giraffe']['git_revision'] = 'node_revision'
    end.converge('fixtures::giraffe_instance')
  end

  context 'for create action' do
    it 'creates a parent directory' do
      expect(chef_run).to create_directory('/somewhere').with(
        recursive: true
      )
    end

    it 'clones the library with git' do
      expect(chef_run).to sync_git('/somewhere/else').with(
        repository: 'a-git-repo',
        revision: 'a-version',
        depth: 1
      )
    end

    it 'renders a template for dashboards.js' do
      expect(chef_run).to create_template('/somewhere/else/dashboards.js').with(
        cookbook: 'giraffe_wrapper',
        source: 'my-custom-dashboards.js.erb'
      )
    end

    it 'renders the dashboard.js file' do
      expect(chef_run).to render_file('/somewhere/else/dashboards.js')
        .with_content(%r{graphite_url = "http://example.com/stats";})
        .with_content(/"awesome"/)
    end
  end

  context 'for delete action' do
  end
end

