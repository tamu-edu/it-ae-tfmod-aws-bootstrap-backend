# vpasc-vpmc-terraform-module-aws-bootstrap-backend

Terraform module for creating AWS CloudFront + Lambda@Edge static sites

## Usage

Example usage:

```hcl
module "aws_bootstrap_backend" {
  source = "https://github.com/Marketing-and-Communications/vpasc-vpmc-terraform-module-aws-bootstrap-backend?ref=v1.0.0"

  aws_profile_name      = "aws_profile_for_authentication"
  s3_bucket_name        = "some-project-name-tf"
  dynamo_db_table_name  = "some-project-name-tf"
}
```

## Releases

1. Create a pull request with a target branch of `main`
2. Tag a release with v1.0.0 (or whatever version) and a workflow will run that updates tags to support semantic versioning in terraform.