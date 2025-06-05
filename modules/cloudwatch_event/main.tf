
resource "aws_cloudwatch_event_rule" "rule" {
  name                = "${var.name_prefix}-${var.event_type}-rule"
  schedule_expression = var.schedule
}

resource "aws_cloudwatch_event_target" "target" {
  rule      = aws_cloudwatch_event_rule.rule.name
  target_id = "${var.event_type}-target"
  arn       = var.lambda_arn
}

resource "aws_lambda_permission" "permission" {
  statement_id  = "${var.event_type}-Invoke"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.rule.arn
}
