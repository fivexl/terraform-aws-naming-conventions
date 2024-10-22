module "s3_names" {
  source = "./modules/naming_generator"

  for_each = {
    terraform_state_bucket_name        = "terraform-state"
    terraform_lock_dynamodb_table_name = "terraform-state-lock"
    s3_access_logs_bucket_name         = "access-logs"
    vpc_flow_logs_bucket_name          = "vpc-flow-logs"
    athena_query_results_bucket_name   = "athena-query-results"
  }

  name          = each.value
  resource_type = "s3"
}
