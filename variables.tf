# Root level variables (variables.tf)

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "instance_ids" {
  description = "Comma-separated list of EC2 instance IDs"
  type        = string
  default     = "i-1234567890abcdef0,i-abcdef01234567890"
}
