
module "iam" {
  source      = "./modules/iam_role"
  name_prefix = "company-ec2"
}

module "start_lambda" {
  source           = "./modules/lambda_function"
  name_prefix      = "company-ec2"
  function_suffix  = "start"
  filename         = "start_instance.zip"
  handler          = "start_instance.lambda_handler"
  lambda_role_arn  = module.iam.lambda_role_arn
}

module "stop_lambda" {
  source           = "./modules/lambda_function"
  name_prefix      = "company-ec2"
  function_suffix  = "stop"
  filename         = "stop_instance.zip"
  handler          = "stop_instance.lambda_handler"
  lambda_role_arn  = module.iam.lambda_role_arn
}

module "start_event" {
  source       = "./modules/cloudwatch_event"
  name_prefix  = "company-ec2"
  event_type   = "start"
  schedule     = var.start_schedule
  lambda_arn   = module.start_lambda.lambda_arn
  lambda_name  = module.start_lambda.lambda_name
}

module "stop_event" {
  source       = "./modules/cloudwatch_event"
  name_prefix  = "company-ec2"
  event_type   = "stop"
  schedule     = var.stop_schedule
  lambda_arn   = module.stop_lambda.lambda_arn
  lambda_name  = module.stop_lambda.lambda_name
}
