output "lambda_arn" {
  value = aws_lambda_function.lambda.arn
}

output "lambda_alias_arn" {
  value = aws_lambda_alias.lambda.arn
}

output "iam_role_arn" {
  value = aws_iam_role.lambda.arn
}



