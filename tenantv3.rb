require 'fog'
require 'fog/openstack'

compute_client = Fog::Compute.new(:provider => :openstack,
                                  :openstack_api_key  => ENV['OS_PASSWORD']  ,
                                  :openstack_username => ENV['OS_USERNAME']  ,
                                  :openstack_auth_url => ENV['OS_AUTH_URL'] + "/auth/tokens/",
                                  :openstack_project   => ENV['OS_PROJECT_NAME'],
                                  :openstack_domain   => ENV['OS_DOMAIN_NAME'])
servers = compute_client.servers

p compute_client.list_servers

servers.each do |server|
  groups = server.service.list_security_groups(server.id).body['security_groups']

  groups.each do |group|
    p group['name']
  end

  net = compute_client.networks
#  p net.server = server
#  p net.methods
end

compute_client.flavors.each do |flavor|
  p flavor
end

compute_client.servers.each do |server|
  p server.flavor['id']
end
