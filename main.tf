
module "iam" {
  source      = "./modules/iam_role"
  name_prefix = "company-ec2"
}

module "start_lambda" {
  source = "./modules/lambda_function"
  lambda_name = "start-ec2-instance"
  instance_ids = var.instance_ids
  lambda_role_arn = module.iam_role.lambda_exec_role_arn
  source_path     = "${path.module}/lambda/start_instance.py"
}

module "stop_lambda" {
  source = "./modules/lambda_function"
  lambda_name = "stop-ec2-instance"
  instance_ids = var.instance_ids
  lambda_role_arn = module.iam_role.lambda_exec_role_arn
  source_path     = "${path.module}/lambda/stop_instance.py"
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
