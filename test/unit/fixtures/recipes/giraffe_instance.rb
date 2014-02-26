giraffe_instance "create-full" do
  path "/somewhere/else"
  graphite_url "http://example.com/stats"
  dashboards([
    { :name => "awesome", :refresh => 600 },
    { :name => "notascool", :refresh => 1600 },
  ])
  action :create
end

giraffe_instance "/tmp/yep"

giraffe_instance "/mnt/big" do
  action :delete
end
