output "lambda_arn" {
  value = aws_lambda_function.lambda.arn
}

output "lambda_alias_arn" {
  value = aws_lambda_alias.lambda.arn
}

output "lambda_alias_name" {
  value = aws_lambda_alias.lambda.name
}

output "lambda_alias_invoke_arn" {
  value = aws_lambda_alias.lambda.invoke_arn
}

output "iam_role_arn" {
  value = aws_iam_role.lambda.arn
}

output "iam_role_name" {
  value = aws_iam_role.lambda.name
}