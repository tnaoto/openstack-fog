require 'fog'
require 'fog/openstack'

identity = Fog::Identity.new(:provider => :openstack,
                                  :openstack_api_key  => ENV['OS_PASSWORD']  ,
                                  :openstack_username => ENV['OS_USERNAME']  ,
                                  :openstack_auth_url => ENV['OS_AUTH_URL'] + "/tokens/"  ,
                                  :openstack_project   => ENV['OS_PROJECT_NAME'],
                                  :openstack_domain   => ENV['OS_DOMAIN_NAME'],
                                  :openstack_tenant   => ENV['OS_TENANT_NAME'])

identity.list_projects.body['projects'].each do |project|
  p project
end
