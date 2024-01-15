variable "allow_bucket_force_destroy" {
  type        = bool
  description = "Allow buckets to be destroyed when doing a terraform destroy"
  default     = false
}
variable "aws_profile_name" {
  type        = string
  description = "The AWS profile name used to authenticate"
}

variable "dynamo_db_table_name" {
  type = string
  description = "Name of the DynamoDB table used for state locking"
}

variable "s3_bucket_name" {
  type        = string
  description = "Name of the S3 bucket used to store state"
}