resource "aws_cloudwatch_event_rule" "schedule" {
  name        = "schedule-${var.lambda_function_name}"
  description = "Schedule for Lambda invocation"
  schedule_expression = var.schedule_expression
}

resource "aws_cloudwatch_event_target" "schedule_target" {
  rule      = aws_cloudwatch_event_rule.schedule.name
  target_id = "lambda-target"
  arn       = var.lambda_function_arn
}

resource "aws_lambda_permission" "allow_event_rule" {
  statement_id  = "AllowExecutionFromCloudWatch-${var.lambda_function_name}"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.schedule.arn
}

output "cloudwatch_event_rule_arn" {
  value = aws_cloudwatch_event_rule.schedule.arn
}