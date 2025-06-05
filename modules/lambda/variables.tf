variable "lambda_name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "lambda_role_arn" {
  description = "The ARN of the IAM role assigned to the Lambda function"
  type        = string
}

variable "instance_ids" {
  description = "Comma-separated list of EC2 instance IDs"
  type        = string
}

variable "source_path" {
  description = "Path to the Lambda zip file"
  type        = string
  default     = "path/to/your/lambda_function.zip"
}