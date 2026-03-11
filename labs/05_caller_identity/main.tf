data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id

  name_prefix = "lab-${var.lab_id}-${local.account_id}"

  common_tags = merge(
    var.base_tags,
    {
      Lab        = var.lab_id
      AccountId  = local.account_id
      NamePrefix = local.name_prefix
    }
  )
}

module "example_bucket" {
  source = "../../modules/s3_bucket"

  bucket_name = "${local.name_prefix}-example"
}