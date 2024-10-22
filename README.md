# Naming Conventions Module
This module is designed to serve as the definitive source for naming conventions within an organization. If you need to create an entity that will be utilized across multiple accounts, you should employ this module to ensure consistency in naming conventions.

# Usage: 
```hcl
module "naming_conventions" {
  source = "fivexl/naming-conventions/aws"
}

locals {
  # All those names are already pre-generated by the module.
  terraform_state_bucket_name        = module.naming_conventions.terraform_state_bucket_name
  terraform_lock_dynamodb_table_name = module.naming_conventions.terraform_lock_dynamodb_table_name
  s3_access_logs_bucket_name         = module.naming_conventions.s3_access_logs_bucket_name
  vpc_flow_logs_bucket_name          = module.naming_conventions.vpc_flow_logs_bucket_name
  athena_query_results_bucket_name   = module.naming_conventions.athena_query_results_bucket_name

  # Other more `unique` names that are pre-generated by the module.
  org_info_ssm_parameter_name = module.naming_conventions.org_info_ssm_parameter_name
  org_info_ram_resource_share_name = module.naming_conventions.org_info_ram_resource_share_name
  shared_kms_key_resource_share_name = module.naming_conventions.shared_kms_key_resource_share_name
  default_kms_key_resource_share_name = module.naming_conventions.default_kms_key_resource_share_name
  s3_access_logs_replication_configuration_ssm_parameter_name = module.naming_conventions.s3_access_logs_replication_configuration_ssm_parameter_name
  s3_access_logs_replication_configuration_resource_share_name = module.naming_conventions.s3_access_logs_replication_configuration_resource_share_name
  chat_bot_topic_arn_ssm_parameter_name = module.naming_conventions.chat_bot_topic_arn_ssm_parameter_name
  chat_bot_topic_arn_resource_share_name = module.naming_conventions.chat_bot_topic_arn_resource_share_name
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_names"></a> [names](#module\_names) | ./modules/naming_generator | n/a |
| <a name="module_s3_names"></a> [s3\_names](#module\_s3\_names) | ./modules/naming_generator | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_delimiter"></a> [delimiter](#input\_delimiter) | The delimiter to use between the name components | `string` | `"-"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | The environment id that would be used for the name of Chatbot topic ssm parameter ex: /shared/{var.environment}/chat-bot-topic-arn | `string` | `"development"` | no |
| <a name="input_hash_algorithm"></a> [hash\_algorithm](#input\_hash\_algorithm) | The hash algorithm that would be used to encode account\_id and region. This is uselful to avoid leaking account\_id and region in the resource name (for example in public S3 bucket names).  Possible values are 'sha1' \| null. Defaults to 'sha1' | `string` | `"sha1"` | no |
| <a name="input_max_length"></a> [max\_length](#input\_max\_length) | The maximum length of the resource name. Defaults to 255 | `number` | `null` | no |
| <a name="input_names"></a> [names](#input\_names) | The names of the resources to generate | `list(string)` | `[]` | no |
| <a name="input_order"></a> [order](#input\_order) | The order of the name components | `list(string)` | <pre>[<br>  "name",<br>  "region",<br>  "env_id"<br>]</pre> | no |
| <a name="input_resource_type"></a> [resource\_type](#input\_resource\_type) | The type of resource to generate a name for. Possible values are 's3' \| 'dynamodb'. | `string` | `"none"` | no |
| <a name="input_with_env_id"></a> [with\_env\_id](#input\_with\_env\_id) | Whether to include the environment id in the name | `bool` | `true` | no |
| <a name="input_with_region"></a> [with\_region](#input\_with\_region) | Whether to include the region in the name | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_athena_query_results_bucket_name"></a> [athena\_query\_results\_bucket\_name](#output\_athena\_query\_results\_bucket\_name) | The name of the S3 bucket for storing Athena query results |
| <a name="output_chat_bot_topic_arn_resource_share_name"></a> [chat\_bot\_topic\_arn\_resource\_share\_name](#output\_chat\_bot\_topic\_arn\_resource\_share\_name) | Name of the RAM resource share for the Chatbot topic ARN |
| <a name="output_chat_bot_topic_arn_ssm_parameter_name"></a> [chat\_bot\_topic\_arn\_ssm\_parameter\_name](#output\_chat\_bot\_topic\_arn\_ssm\_parameter\_name) | Name of the SSM parameter for the Chatbot topic ARN |
| <a name="output_default_kms_key_resource_share_name"></a> [default\_kms\_key\_resource\_share\_name](#output\_default\_kms\_key\_resource\_share\_name) | Name of the RAM resource share for the default KMS key |
| <a name="output_names"></a> [names](#output\_names) | The generated names for the resources |
| <a name="output_org_info_ram_resource_share_name"></a> [org\_info\_ram\_resource\_share\_name](#output\_org\_info\_ram\_resource\_share\_name) | Name of the RAM resource share for the organization information ssm parameter |
| <a name="output_org_info_ssm_parameter_name"></a> [org\_info\_ssm\_parameter\_name](#output\_org\_info\_ssm\_parameter\_name) | Name of the ssm parameter with the organization information |
| <a name="output_s3_access_logs_bucket_name"></a> [s3\_access\_logs\_bucket\_name](#output\_s3\_access\_logs\_bucket\_name) | The name of the S3 bucket for storing access logs |
| <a name="output_s3_access_logs_replication_configuration_resource_share_name"></a> [s3\_access\_logs\_replication\_configuration\_resource\_share\_name](#output\_s3\_access\_logs\_replication\_configuration\_resource\_share\_name) | Name of the RAM resource share for the S3 access logs replication configuration |
| <a name="output_s3_access_logs_replication_configuration_ssm_parameter_name"></a> [s3\_access\_logs\_replication\_configuration\_ssm\_parameter\_name](#output\_s3\_access\_logs\_replication\_configuration\_ssm\_parameter\_name) | Name of the SSM parameter for the S3 access logs replication configuration |
| <a name="output_shared_kms_key_resource_share_name"></a> [shared\_kms\_key\_resource\_share\_name](#output\_shared\_kms\_key\_resource\_share\_name) | Name of the RAM resource share for the shared KMS key |
| <a name="output_terraform_lock_dynamodb_table_name"></a> [terraform\_lock\_dynamodb\_table\_name](#output\_terraform\_lock\_dynamodb\_table\_name) | The name of the DynamoDB table for locking Terraform state |
| <a name="output_terraform_state_bucket_name"></a> [terraform\_state\_bucket\_name](#output\_terraform\_state\_bucket\_name) | The name of the S3 bucket for storing Terraform state |
| <a name="output_vpc_flow_logs_bucket_name"></a> [vpc\_flow\_logs\_bucket\_name](#output\_vpc\_flow\_logs\_bucket\_name) | The name of the S3 bucket for storing VPC flow logs |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
