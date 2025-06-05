variable "lambda_function_arn" {
  description = "The ARN of the Lambda function to trigger"
  type        = string
}

variable "schedule_expression" {
  description = "The cron expression or rate expression for the schedule"
  type        = string
}
