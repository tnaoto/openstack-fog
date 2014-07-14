require 'fog'
require 'fog/openstack'

identity = Fog::Identity.new(:provider => :openstack,
                                  :openstack_api_key  => ENV['OS_PASSWORD']  ,
                                  :openstack_username => ENV['OS_USERNAME']  ,
                                  :openstack_auth_url => ENV['OS_AUTH_URL'] + "/auth/tokens/",
                                  :openstack_project   => ENV['OS_PROJECT_NAME'],
                                  :openstack_domain   => ENV['OS_DOMAIN_NAME'])
#p identity.methods
identity.list_projects.body['projects'].each do |project|
  p project
end

#id = identity.create_project(:description => "test", :domain_id => "default", :enabled => true, :name =>  "hogehoge")

identity.update_project("1c35d077acd348b6ba8b21f709e70879" , {:name => "hogehoge", :description => "hogehoge"} )

identity.delete_project("1c35d077acd348b6ba8b21f709e70879")
