variable "ec2_instance_ids" {
  description = "Comma-separated list of EC2 instance IDs"
  type        = string
  default     = "i-0e193b703bd005734"
}

variable "aws_region" {
  description = "region"
  type        = string
  default     = "us-east-1"
}
