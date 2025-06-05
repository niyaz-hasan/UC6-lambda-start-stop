resource "aws_lambda_function" "ec2_lambda" {
  function_name = var.lambda_name
  role          = var.lambda_role_arn
  runtime       = "python3.8"
  handler       = "${var.lambda_name}.lambda_handler"
  timeout       = 60

  filename      = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  environment {
    variables = {
      INSTANCE_IDS = var.instance_ids
    }
  }
}


data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = var.source_path
  output_path = "${path.module}/lambda.zip"
}

output "lambda_function_arn" {
  value = aws_lambda_function.ec2_lambda.arn
}

output "lambda_function_name" {
  value = aws_lambda_function.ec2_lambda.function_name
}