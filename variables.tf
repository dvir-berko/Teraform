# -------- variables.tf --------
variable "aws_region" {
  description = "AWS region for resources"
  type        = string
  default     = "us-east-1" # your requested default
}

variable "aws_profile" {
  description = "AWS CLI/SSO profile name"
  type        = string
  default     = "my-aws"
}

variable "tags" {
  description = "Default tags applied to all resources"
  type        = map(string)
  default = {
    Project = "Terraform-Labs"
    Owner   = "Dvir"
    Managed = "terraform"
  }
}
# -------- end --------
