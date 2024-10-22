variable "names" {
  description = "The names of the resources to generate"
  type        = list(string)
  default     = []
}

variable "resource_type" {
  description = "The type of resource to generate a name for. Possible values are 's3' | 'dynamodb'."
  type        = string
  default     = "none"
}

variable "max_length" {
  description = "The maximum length of the resource name. Defaults to 255"
  type        = number
  default     = null
}

variable "with_region" {
  description = "Whether to include the region in the name"
  type        = bool
  default     = false
}

variable "with_env_id" {
  description = "Whether to include the environment id in the name"
  type        = bool
  default     = true
}

variable "order" {
  description = "The order of the name components"
  type        = list(string)
  default     = ["name", "region", "env_id"]
}

variable "delimiter" {
  description = "The delimiter to use between the name components"
  type        = string
  default     = "-"
}

variable "hash_algorithm" {
  description = "The hash algorithm that would be used to encode account_id and region. This is uselful to avoid leaking account_id and region in the resource name (for example in public S3 bucket names).  Possible values are 'sha1' | null. Defaults to 'sha1'"
  type        = string
  default     = "sha1"
}

variable "environment" {
  description = "The environment id that would be used for the name of Chatbot topic ssm parameter ex: /shared/{var.environment}/chat-bot-topic-arn"
  type        = string
  default     = "development"
}
