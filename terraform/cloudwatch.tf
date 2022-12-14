resource "aws_cloudwatch_log_group" "lambda" {
  # checkov:skip=CKV_AWS_158:Ensure that CloudWatch Log Group is encrypted by KMS
  name = "/aws/lambda/${var.function_name}${var.suffix}"

  retention_in_days = 30
}