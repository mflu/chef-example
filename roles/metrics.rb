name "metrics"
description "Node to measure metrics across system"
run_list(
  "role[base]",
  "recipe[graphite]",
  "recipe[collectd::server]",
  #"recipe[collectd::client]",
  "recipe[collectd_plugins::syslog]",
  "recipe[collectd_plugins::cpu]",
  "recipe[collectd_plugins::df]",
  "recipe[collectd_plugins::disk]",
  "recipe[collectd_plugins::interface]",
  "recipe[collectd_plugins::memory]",
  "recipe[collectd_plugins::swap]",
  "recipe[jmxtrans]"
)
override_attributes(
  :graphite => {
    :carbon => {
      :line_receiver => { :interface => "0.0.0.0" }
    }
  }
)
