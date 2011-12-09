name "metrics"
description "Node to measure metrics across system"
run_list(
  "role[base]",
  "recipe[collectd::server]",
  "recipe[collectd::client]",
  "recipe[collectd_plugins::syslog]",
  "recipe[collectd_plugins::cpu]",
  "recipe[collectd_plugins::df]",
  "recipe[collectd_plugins::disk]",
  "recipe[collectd_plugins::interface]",
  "recipe[collectd_plugins::memory]",
  "recipe[collectd_plugins::swap]",
  "recipe[graphite]"
)
