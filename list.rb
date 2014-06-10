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
  p server.addresses
  p server.all_addresses
  p server.ip_addresses
  p server.floating_ip_addresses
  p server.public_ip_addresses
  p server.floating_ip_address
  p server.public_ip_address
  p server.private_ip_addresses
  p server.private_ip_address

end

=begin
net_cli = Fog::Network.new(:provider => :openstack,
                       :openstack_api_key  => ENV['OS_PASSWORD']  ,
                       :openstack_username => ENV['OS_USERNAME']  ,
                       :openstack_auth_url => ENV['OS_AUTH_URL'] + "/tokens/")
#p net_cli.methods
=end

#p net_cli.networks.all

