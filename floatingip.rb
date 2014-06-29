require 'fog'
require 'fog/openstack'

compute_client = Fog::Compute.new(:provider => :openstack,
                                  :openstack_api_key  => ENV['OS_PASSWORD']  ,
                                  :openstack_username => ENV['OS_USERNAME']  ,
                                  :openstack_auth_url => ENV['OS_AUTH_URL'] + "/tokens/"  ,
                                  :openstack_tenant   => ENV['OS_TENANT_NAME'])

net_cli = Fog::Network.new(:provider => :openstack,
                       :openstack_api_key  => ENV['OS_PASSWORD']  ,
                       :openstack_username => ENV['OS_USERNAME']  ,
                       :openstack_auth_url => ENV['OS_AUTH_URL'] + "/tokens/")
netids = net_cli.list_networks.body['networks'].map{|v| v['id']}

service = compute_client
flavor = service.flavors.first
image = service.images.first
#server = service.servers.create(:name => 'fog-doc', :flavor_ref => flavor.id,
#:image_ref => image.id,:nics => ["net_id" => netids[0]])

#net_cli.list_floating_ips.body['floatingips'].each do |aa|
#  p aa
#end

p fips = net_cli.list_floating_ips.body['floatingips'].map {|_| _['floating_ip_address']}
#p service.associate_address(server.id,fips[0])
