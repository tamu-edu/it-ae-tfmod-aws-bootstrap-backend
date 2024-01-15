resource "aws_s3_bucket" "tf_state_bucket" {
  bucket        = var.s3_bucket_name
  force_destroy = var.allow_bucket_force_destroy
}

#resource "aws_s3_bucket_acl" "tf_state_bucket_acl" {
#  bucket = aws_s3_bucket.tf_state_bucket.id
#  acl    = "private"
#}

resource "aws_s3_bucket_public_access_block" "tf_state_bucket_block" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state_bucket_encryption" {
  bucket = aws_s3_bucket.tf_state_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
  }
}

resource "aws_dynamodb_table" "tf_state_lock_dynamo_db" {
  name         = var.dynamo_db_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
