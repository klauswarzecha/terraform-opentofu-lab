terraform {
  backend "s3" {
    bucket         = "terraform-opentofu-lab-state-828e6b"
    key            = "envs/dev/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-opentofu-lab-lock"
    encrypt        = true
  }
}