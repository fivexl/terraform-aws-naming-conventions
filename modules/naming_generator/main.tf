
locals {
  account_id = data.aws_caller_identity.current.account_id
  region     = data.aws_region.current.region

  env_id = format("%s-%s", local.account_id, local.region)

  env_id_encoding = {
    "sha1" = sha1(local.env_id)
  }

  env_id_encoded = var.hash_algorithm == null ? local.env_id : local.env_id_encoding[var.hash_algorithm]

  name_components = {
    "name"   = var.name
    "region" = var.with_region ? local.region : null
    "env_id" = var.with_env_id ? local.env_id_encoded : null
  }
  full_name = join(var.delimiter, [for component in var.order : local.name_components[component] if local.name_components[component] != null])

  # Handle the max length of the resource name
  max_length_by_resource = {
    # https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-trail-naming-requirements.html#cloudtrail-s3-bucket-naming-requirements
    "s3" = 63
    # https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_CreateTable.html#DDB-CreateTable-request-TableName
    "dynamodb" = 255
    "none"     = 255
  }
  max_length = var.max_length != null ? var.max_length : local.max_length_by_resource[var.resource_type]
  # Truncate to ensure it's 'max_length' characters or fewer
  final_name = length(local.full_name) > local.max_length ? substr(local.full_name, 0, local.max_length) : local.full_name
}

output "name" {
  value       = local.final_name
  description = "The generated name for the resource"
}
