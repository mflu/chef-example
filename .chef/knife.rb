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


# Amazon access keys for the webservice
knife[:aws_access_key_id] = ENV['AWS_ACCESS_KEY_ID']
knife[:aws_secret_access_key] = ENV['AWS_SECRET_ACCESS_KEY']

# Amazon EC2 SSH access keys
knife[:identity_file] = "#{ENV['CHEF_USER_KEY_DIR']}/#{user}-id_rsa-ec2"
knife[:aws_ssh_key_id] = ENV['AWS_SSH_KEY_ID']

# Amazon EC2 Region/Availability zone
knife[:availability_zone] = "eu-west-1a"
knife[:region] = "eu-west-1"