include_recipe "apache2"

giraffe_instance "/srv/www/giraffe" do
  graphite_url "http://127.0.0.1"
end

template "#{node['apache']['dir']}/sites-available/giraffe" do
  source "giraffe-vhost.conf.erb"
  notifies :reload, "service[apache2]"
end

apache_site "giraffe"
