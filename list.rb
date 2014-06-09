require 'fog'
require 'fog/openstack'

compute_client = Fog::Compute.new(:provider => :openstack,
                                  :openstack_api_key  => ENV['OS_PASSWORD']  ,
                                  :openstack_username => ENV['OS_USERNAME']  ,
                                  :openstack_auth_url => ENV['OS_AUTH_URL'] + "/tokens/"  ,
                                  :openstack_tenant   => ENV['OS_TENANT_NAME'])

p tmp = compute_client.list_flavors

net = Fog::Network.new(:provider => :openstack,
                       :openstack_api_key  => ENV['OS_PASSWORD']  ,
                       :openstack_username => ENV['OS_USERNAME']  ,
                       :openstack_auth_url => ENV['OS_AUTH_URL'] + "/tokens/")
p net.list_routers
