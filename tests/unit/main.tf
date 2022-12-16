provider "aws" {
  region = "ap-southeast-2"
}

module "lambda_basic" {
  source = "../../terraform"

  bucket_lambda_code = aws_s3_bucket.temp.arn
  bucket_path_lambda_code	= aws_s3_object.temp.key
  function_name	= "tf-mod-lambda-test"
  handler = "index.lambda_handler"
  runtime = "python3.9"
}

module "lambda_basic_vars" {
  source = "../../terraform"

  bucket_lambda_code = aws_s3_bucket.temp.arn
  bucket_path_lambda_code	= aws_s3_object.temp.key
  function_name	= "tf-mod-lambda-test"
  handler = "index.lambda_handler"
  runtime = "python3.9"
  environment_variables = {
    TEST = "test"
  }
}

resource "aws_s3_bucket" "temp" {
  bucket_prefix = "tf-mod-lambda-test-bucket"
}

resource "aws_s3_object" "temp" {
  bucket = aws_s3_bucket.temp.arn
  key    = "lambda-test"
  source = "index.py"
}