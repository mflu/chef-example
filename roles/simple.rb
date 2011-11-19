name "simple"
description "Simple role applied to test nodes"
run_list(
  "role[base]",
  "recipe[getting-started]"
)
