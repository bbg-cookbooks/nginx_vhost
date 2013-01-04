bag = node.nginx.vhost.data_bag_name

node.nginx.vhosts.each do |instance|
  instance_data = data_bag_item( bag, instance )

  nginx_vhost instance do
    instance_data.each do |attribute,value|
      send(attribute, value) unless attribute == "id"
    end
  end
end
