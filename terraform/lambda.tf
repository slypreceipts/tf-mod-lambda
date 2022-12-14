resource "aws_lambda_function" "lambda" {
  # checkov:skip=CKV_AWS_50:X-ray tracing is enabled for Lambda
  # checkov:skip=CKV_AWS_117:Ensure that AWS Lambda function is configured inside a VPC
  # checkov:skip=CKV_AWS_116:Ensure that AWS Lambda function is configured for a Dead Letter Queue(DLQ)
  # checkov:skip=CKV_AWS_173:Check encryption settings for Lambda environmental variable
  # checkov:skip=CKV_AWS_272:Ensure AWS Lambda function is configured to validate code-signing
  # checkov:skip=CKV_AWS_115:Ensure that AWS Lambda function is configured for function-level concurrent execution limit
  function_name = "${var.service}${var.suffix}"
  role          = aws_iam_role.lambda.arn
  handler       = var.handler

  s3_bucket         = data.aws_s3_object.lambda_code.bucket
  s3_key            = data.aws_s3_object.lambda_code.key
  s3_object_version = data.aws_s3_object.lambda_code.version_id

  runtime = var.python_version

  environment {
    variables = var.environment_variables
  }

  tags = var.tags

  depends_on = [
    aws_iam_role_policy_attachment.lambda_policy,
    aws_cloudwatch_log_group.lambda,
  ]
}

resource "aws_lambda_alias" "lambda" {
  name             = var.alias
  function_name    = aws_lambda_function.lambda.arn
  function_version = aws_lambda_function.lambda.version
}

data "aws_s3_object" "lambda_code" {
  bucket = var.bucket_lambda_code
  key    = var.bucket_path_lambda_code
}