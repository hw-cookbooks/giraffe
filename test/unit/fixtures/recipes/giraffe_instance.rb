giraffe_instance "create-full" do
  path "/somewhere/else"
  graphite_url "http://example.com/stats"
  dashboards([
    { :name => "awesome", :refresh => 600 },
    { :name => "notascool", :refresh => 1600 },
  ])
  git_repository "a-git-repo"
  git_revision "a-version"
  template_cookbook "giraffe_wrapper"
  template_source "a-dashboards-file"
  action :create
end

giraffe_instance "/tmp/yep"

giraffe_instance "/mnt/big" do
  action :delete
end
