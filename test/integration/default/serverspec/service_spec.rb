require 'serverspec'
require 'uri'
require 'net/http'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

RSpec.configure do |c|
  c.before :all do
    c.path = '/sbin:/usr/sbin'
  end
end

describe "Git Daemon" do

  it "is listening on port 8080" do
    expect(port(8080)).to be_listening
  end

  it "web port responds as a giraffe site" do
    uri = URI('http://127.0.0.1:8080')
    response = Net::HTTP.get_response(uri)
    js = Regexp.escape(%{<script src="dashboards.js"></script>})
    expect(response.body).to match(Regexp.new(js))
  end
end
