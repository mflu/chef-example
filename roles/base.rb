name "base"
description "Base role is applied to all nodes"
run_list(
  "recipe[users::sysadmins]",
  "recipe[sudo]",
  "recipe[apt]",
  "recipe[ntp]",
  "recipe[build-essential]",
  "recipe[chef-client::service]"
)
default_attributes(
  :authorization => {
    :sudo => {
      :groups => ["sysadmin"],
      :users => ["ubuntu"],
      :passwordless => true
    }
  }
)
