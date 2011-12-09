name "metrics"
description "Node to measure metrics across system"
run_list(
  "role[base]",
  "recipe[collectd]",
  "recipe[collectd_plugins]",
  "recipe[graphite]"
)
