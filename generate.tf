module "names" {
  source = "./modules/naming_generator"

  for_each = { for v in var.names : v => v }

  name           = each.key
  resource_type  = var.resource_type
  max_length     = var.max_length
  with_region    = var.with_region
  with_env_id    = var.with_env_id
  order          = var.order
  delimiter      = var.delimiter
  hash_algorithm = var.hash_algorithm
}

output "names" {
  value       = { for k, v in module.names : k => v.name }
  description = "The generated names for the resources"
}
