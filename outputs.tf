output "start_lambda_arn" {
  description = "ARN of the Lambda function that starts EC2 instances"
  value       = module.start_ec2_lambda.lambda_function_arn
}

output "stop_lambda_arn" {
  description = "ARN of the Lambda function that stops EC2 instances"
  value       = module.stop_ec2_lambda.lambda_function_arn
}
