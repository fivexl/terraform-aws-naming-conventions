# Static outputs

output "org_info_ssm_parametes_names" {
  value = {
    org_arn                 = "/shared/management/org-arn"
    root_id                 = "/shared/management/root-id"
    org_id                  = "/shared/management/org-id"
    master_account_id       = "/shared/management/master-account-id"
    accounts                = "/shared/management/accounts"
    ous                     = "/shared/management/ous"
    accounts_by_environment = "/shared/management/accounts-by-environment"
  }
  description = "This is a map of the SSM parameter names for the 'org_info' shared ssm parameter."
}

output "org_info_ram_resource_share_names" {
  value = {
    org_arn                 = "ssm-shared-management-org-arn"
    root_id                 = "ssm-shared-management-root-id"
    org_id                  = "ssm-shared-management-org-id"
    master_account_id       = "ssm-shared-management-master-account-id"
    accounts                = "ssm-shared-management-accounts"
    ous                     = "ssm-shared-management-ous"
    accounts_by_environment = "ssm-shared-management-accounts-by-environment"
  }
  description = "This is a map of the RAM resource share names for the 'org_info' shared ssm parameter."
}


output "org_info_ssm_parameter_name" {
  value       = "/root/management/org-info"
  description = "Deprecated, will be removed in the next major release. Name of the ssm parameter with the organization information"
}

output "org_info_ram_resource_share_name" {
  value       = "ssm-root-management-org-info"
  description = "Deprecated, will be removed in the next major release. Name of the RAM resource share for the organization information ssm parameter"
}

output "shared_kms_key_resource_share_name" {
  value       = "ssm-infrastructure-kms-shared-arn"
  description = "Name of the RAM resource share for the shared KMS key"
}

output "default_kms_key_resource_share_name" {
  value       = "ssm-infrastructure-kms-default-arn"
  description = "Name of the RAM resource share for the default KMS key"
}

output "s3_access_logs_replication_configuration_ssm_parameter_name" {
  value       = "/shared/log-archive/s3-access-logs-replication-configuration"
  description = "Name of the SSM parameter for the S3 access logs replication configuration"
}

output "s3_access_logs_replication_configuration_resource_share_name" {
  value       = "ssm-shared-log-archive-s3-access-logs-replication-configuration"
  description = "Name of the RAM resource share for the S3 access logs replication configuration"
}

# Dynamically generated outputs

output "chat_bot_topic_arn_ssm_parameter_name" {
  value       = "/shared/${var.environment}/chat-bot-topic-arn"
  description = "Name of the SSM parameter for the Chatbot topic ARN"
}

output "chat_bot_topic_arn_resource_share_name" {
  value       = "ssm-shared-${var.environment}-chat-bot-topic-arn"
  description = "Name of the RAM resource share for the Chatbot topic ARN"
}

output "terraform_state_bucket_name" {
  value       = module.s3_names["terraform_state_bucket_name"].name
  description = "The name of the S3 bucket for storing Terraform state"
}

output "terraform_lock_dynamodb_table_name" {
  value       = module.s3_names["terraform_lock_dynamodb_table_name"].name
  description = "The name of the DynamoDB table for locking Terraform state"
}

output "s3_access_logs_bucket_name" {
  value       = module.s3_names["s3_access_logs_bucket_name"].name
  description = "The name of the S3 bucket for storing access logs"
}

output "vpc_flow_logs_bucket_name" {
  value       = module.s3_names["vpc_flow_logs_bucket_name"].name
  description = "The name of the S3 bucket for storing VPC flow logs"
}

output "athena_query_results_bucket_name" {
  value       = module.s3_names["athena_query_results_bucket_name"].name
  description = "The name of the S3 bucket for storing Athena query results"
}
