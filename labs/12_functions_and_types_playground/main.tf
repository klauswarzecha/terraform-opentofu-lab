locals {
  upper_names = [
    for n in var.names : upper(n)
  ]

  distinct_names = distinct(var.names)

  names_as_set        = toset(var.names)
  names_as_list_again = tolist(local.names_as_set)

  merged_labels = merge(
    var.labels,
    {
      lab_id = "12"
      topic  = "functions-and-types"
    }
  )

  label_keys   = keys(local.merged_labels)
  label_values = values(local.merged_labels)

  name_lengths = {
    for n in distinct(var.names) : n => length(n)
  }

  indexed_names = zipmap(
    [for idx, _ in var.names : tostring(idx)],
    var.names
  )

  three_subnet_cidrs = [
    cidrsubnet(var.base_cidr, 8, 1),
    cidrsubnet(var.base_cidr, 8, 2),
    cidrsubnet(var.base_cidr, 8, 3)
  ]

  nested_list = [
    ["a", "b"],
    ["c", "d"]
  ]

  flat_list = flatten(local.nested_list)
}