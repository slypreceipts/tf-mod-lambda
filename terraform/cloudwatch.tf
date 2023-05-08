resource "aws_cloudwatch_log_group" "lambda" {
  # checkov:skip=CKV_AWS_158:Ensure that CloudWatch Log Group is encrypted by KMS
  # checkov:skip=CKV_AWS_338:Ensure CloudWatch log groups retains logs for at least 1 year

  name = "/aws/lambda/${var.function_name}${var.suffix}"

  retention_in_days = var.log_retention
}