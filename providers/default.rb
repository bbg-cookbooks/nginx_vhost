def load_current_resource
  new_resource.log_dir
  new_resource.nginx_dir
  new_resource.upstream
  new_resource.servers
  new_resource.sockets
  new_resource.hostname
  new_resource.port
  new_resource.root_path
  new_resource.ssl_key
  new_resource.ssl_cert
end

action :enable do
  [new_resource.log_dir,
  new_resource.nginx_dir,
  "#{new_resource.nginx_dir}/sites-enabled",
  "#{new_resource.nginx_dir}/sites-available",
  ].each do |dir|
    directory dir  do
      recursive true
    end
  end

  name = new_resource.name

  template "#{new_resource.nginx_dir}/sites-available/#{name}" do
    source "vhost.conf.erb"
    mode "0644"
    owner "root"
    variables new_resource.to_hash
    notifies     :reload, "service[nginx]"
  end

  link "#{new_resource.nginx_dir}/sites-enabled/#{name}" do
    to "#{new_resource.nginx_dir}/sites-available/#{name}"
  end

  new_resource.updated_by_last_action(true)

end

action :disable do
  link "#{new_resource.nginx_dir}/sites-available/#{name}" do
    action :delete
    notifies     :reload, "service[nginx]"
  end
  new_resource.updated_by_last_action(true)
end
