provider "aws" {
  region = var.region
}

module "iam_role" {
  source = "./modules/iam_role"
}

module "start_ec2_lambda" {
  source = "./modules/lambda"
  lambda_name = "start-ec2-instance"
  instance_ids = var.instance_ids
  lambda_role_arn = module.iam_role.lambda_exec_role_arn
}

module "stop_ec2_lambda" {
  source = "./modules/lambda"
  lambda_name = "stop-ec2-instance"
  instance_ids = var.instance_ids
  lambda_role_arn = module.iam_role.lambda_exec_role_arn
}

module "start_ec2_schedule" {
  source = "./modules/cloudwatch_event"
  lambda_function_arn = module.start_ec2_lambda.lambda_function_arn
  schedule_expression = "cron(0 8 ? * MON-FRI *)"
}

module "stop_ec2_schedule" {
  source = "./modules/cloudwatch_event"
  lambda_function_arn = module.stop_ec2_lambda.lambda_function_arn
  schedule_expression = "cron(0 17 ? * MON-FRI *)"
}

output "start_lambda_arn" {
  value = module.start_ec2_lambda.lambda_function_arn
}

output "stop_lambda_arn" {
  value = module.stop_ec2_lambda.lambda_function_arn
}
