require 'fog'
require 'fog/openstack'

compute_client = Fog::Compute.new(:provider => :openstack,
                                  :openstack_api_key  => ENV['OS_PASSWORD']  ,
                                  :openstack_username => ENV['OS_USERNAME']  ,
                                  :openstack_auth_url => ENV['OS_AUTH_URL'] + "/tokens/"  ,
                                  :openstack_tenant   => ENV['OS_TENANT_NAME'])
servers = compute_client.servers

#p compute_client.list_servers

servers.each do |server|
  groups = server.service.list_security_groups(server.id).body['security_groups']

  groups.each do |group|
    p group['name']
  end

  net = compute_client.networks
  #  p net.server = server
  #  p net.methods
end
