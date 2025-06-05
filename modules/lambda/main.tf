resource "aws_lambda_function" "ec2_lambda" {
  function_name = var.lambda_name
  role          = var.lambda_role_arn
  runtime       = "python3.8"
  handler       = "${var.lambda_name}.lambda_handler"
  timeout       = 60

  filename      = var.lambda_zip

  environment {
    variables = {
      INSTANCE_IDS = var.instance_ids
    }
  }
}

output "lambda_function_arn" {
  value = aws_lambda_function.ec2_lambda.arn
}