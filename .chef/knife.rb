user = ENV['OPSCODE_USER']
orgname = ENV['OPSCODE_ORGNAME']

log_level                :info
log_location             STDOUT
node_name                user
client_key               "#{ENV['CHEF_USER_KEY_DIR']}/#{user}.pem"
validation_client_name   "#{orgname}-validator"
validation_key           "#{ENV['CHEF_ORG_KEY_DIR']}/#{orgname}-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/#{orgname}"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{File.dirname(__FILE__)}/../cookbooks"]
