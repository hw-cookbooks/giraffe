require_relative '../spec_helper'

describe 'giraffe::default' do
  let(:chef_run) do
    ChefSpec::Runner.new.converge(described_recipe)
  end

  it 'includes the git default recipe' do
    expect(chef_run).to include_recipe('git')
  end
end

