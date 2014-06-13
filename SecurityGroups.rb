require 'fog'
require 'fog/openstack'

compute_client = Fog::Compute.new(:provider => :openstack,
                                  :openstack_api_key  => ENV['OS_PASSWORD']  ,
                                  :openstack_username => ENV['OS_USERNAME']  ,
                                  :openstack_auth_url => ENV['OS_AUTH_URL'] + "/tokens/"  ,
                                  :openstack_tenant   => ENV['OS_TENANT_NAME'])
tmp = nil
compute_client.servers.each do |server|
  server.security_groups.each do |group|
    if(tmp != nil)
     p  tmp = tmp + " : " + group.name
   else
     tmp = group.name
   end
  end

#p tmp = tmp + ":" + server.security_groups.select{|group| group.name}
end

compute_client.security_groups.each do |security_group|
  p security_group
end
