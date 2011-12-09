name "metrics"
description "Node to measure metrics across system"
run_list(
  "role[base]",
  "recipe[graphite]"
)
