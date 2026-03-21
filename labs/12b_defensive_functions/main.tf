locals {
  # lookup with default
  env = lookup(var.user_config, "env", "dev")

  # try -> safe access
  description = try(var.user_config.description, "no-description")

  # can -> check existence
  has_owner = can(var.user_config.owner)

  owner = can(var.user_config.owner) ? var.user_config.owner : "unknown"

  # coalesce -> first non-null / non-empty
  name = coalesce(
    try(var.user_config.name, null),
    var.fallback_name
  )

  # nested example
  nested_try = try(
    var.user_config.settings.timeout,
    30
  )
}