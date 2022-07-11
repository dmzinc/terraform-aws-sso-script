variable "region" {
  description = "AWS region to create resources in"
  type        = string
  default     = "us-west-2"
}

variable "permission_list" {
  type = list(object({
    name             = string
    description      = string
    instance_arn     = string
    managed_policies = list(string)
    aws_accounts     = list(string)
    sso_groups       = list(string)
  }))
  description = "List of permission set properties"
}
