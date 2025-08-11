# -------- main.tf --------
terraform {
  required_version = ">= 1.7.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Optional: when you’re ready to use remote state, fill this and uncomment.
  # backend "s3" {
  #   bucket         = "your-unique-tf-state-bucket"
  #   key            = "global/terraform.tfstate"
  #   region         = "us-east-1"
  #   dynamodb_table = "your-tf-locks-table"
  #   encrypt        = true
  # }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile

  default_tags {
    tags = var.tags
  }
}

# No resources yet—just verify connectivity safely:
data "aws_caller_identity" "current" {}
data "aws_region"          "current" {}

output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "aws_region_effective" {
  value = data.aws_region.current.name
}

# If you want to test creating something later, uncomment this S3 bucket:
# resource "aws_s3_bucket" "demo" {
#   bucket = "dvir-terraform-demo-${random_id_suffix}"
# }
#
# locals {
#   random_id_suffix = substr(replace(uuid(), "-", ""), 0, 8)
# }
# -------- end --------
