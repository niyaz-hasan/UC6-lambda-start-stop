
resource "aws_lambda_function" "lambda" {
  function_name    = "${var.name_prefix}-${var.function_suffix}"
  filename         = "${path.module}/lambda/${var.filename}"
  source_code_hash = filebase64sha256("${path.module}/lambda/${var.filename}")
  role             = var.lambda_role_arn
  handler          = var.handler
  runtime          = var.runtime
}
