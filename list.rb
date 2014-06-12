require 'fog'
require 'fog/openstack'

compute_client = Fog::Compute.new(:provider => :openstack,
                                  :openstack_api_key  => ENV['OS_PASSWORD']  ,
                                  :openstack_username => ENV['OS_USERNAME']  ,
                                  :openstack_auth_url => ENV['OS_AUTH_URL'] + "/tokens/"  ,
                                  :openstack_tenant   => ENV['OS_TENANT_NAME'])

#p tmps = compute_client.servers.all

#tmps.each do |tmp|
#  p server = tmp.name
#end

servers = compute_client.servers

servers.each do |server|
p groups = server.service.list_security_groups(server.id).body['security_groups']

  groups.each do |group|
    p group['name']
  end

  net = compute_client.networks
  p net.server = server
  p net.methods
end



=begin
net_cli = Fog::Network.new(:provider => :openstack,
                       :openstack_api_key  => ENV['OS_PASSWORD']  ,
                       :openstack_username => ENV['OS_USERNAME']  ,
                       :openstack_auth_url => ENV['OS_AUTH_URL'] + "/tokens/")
#p net_cli.methods
=end

#p net_cli.networks.all
