def env_get(key,default = nil)
   value = ENV[key] || default
  raise "Environment variable #{key} is not specified" unless value
  ENV[key] = orgname unless ENV[key]
  value
end

def find_key(key_key,dir_key,key_name)
  key_filename = ENV[key_key] || "#{ENV[dir_key] || File.dirname(__FILE__)}/#{key_name}"
  raise "Key does not exist at #{key_filename} - add the key or set the #{dir_key} environment variable" unless File.exist?(key_filename)
  key_filename
end


def chef_user()
  env_get('OPSCODE_USER')
end

def chef_organisation()
  env_get('OPSCODE_ORGNAME')
end

def chef_validation_client_name()
  "#{chef_organisation()}-validator"
end

log_level                :info
log_location             STDOUT
node_name                chef_user()
client_key               find_key('CHEF_USER_KEY_LOCATION','CHEF_USER_KEY_DIR',"#{chef_user()}.pem")
validation_client_name   chef_validation_client_name()
validation_key           find_key('CHEF_ORG_KEY_LOCATION','CHEF_ORG_KEY_DIR',"#{chef_validation_client_name()}.pem")
chef_server_url          "https://api.opscode.com/organizations/#{chef_organisation()}"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{File.dirname(__FILE__)}/../cookbooks"]

cookbook_copyright       ENV['CHEF_COOKBOOK_COPYRIGHT'] || chef_organisation()
cookbook_email           ENV['CHEF_COOKBOOK_AUTHOR'] || chef_user()
cookbook_license         'apachev2'
readme_format            'md'

# Amazon access keys for the webservice
knife[:aws_access_key_id] = env_get('AWS_ACCESS_KEY_ID')
knife[:aws_secret_access_key] = env_get('AWS_SECRET_ACCESS_KEY')

# Amazon EC2 SSH access keys
knife[:identity_file] = find_key('CHEF_USER_KEY_LOCATION','CHEF_USER_KEY_DIR',"#{chef_user()}-ec2.pem")
knife[:aws_ssh_key_id] = env_get('AWS_SSH_KEY_ID')

# Amazon EC2 Region/Availability zone
knife[:availability_zone] = "eu-west-1a"
knife[:region] = "eu-west-1"