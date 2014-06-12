require 'fog'
require 'fog/openstack'

compute_client = Fog::Compute.new(:provider => :openstack,
                                  :openstack_api_key  => ENV['OS_PASSWORD']  ,
                                  :openstack_username => ENV['OS_USERNAME']  ,
                                  :openstack_auth_url => ENV['OS_AUTH_URL'] + "/tokens/"  ,
                                  :openstack_tenant   => ENV['OS_TENANT_NAME'])

compute_client.servers.each do |server|
  server.addresses['internal'].each do |nic|
    if nic['OS-EXT-IPS:type'] == "fixed"
      p nic['addr']
    end
  end

p  server.addresses['internal'].select{ |nic| nic['OS-EXT-IPS:type'] == "fixed"}.map{|nic| nic['addr']}[0]
end


compute_client.servers.each do |server|
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
