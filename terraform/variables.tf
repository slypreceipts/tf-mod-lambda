#### Required Variables ####
variable "function_name" {
  description = "The name of the lambda function"
  type = string
}

variable "handler" {
  description = "The lambda function handler"
  type = string
}

variable "tags" {
  description = "Map of tags to apply"
  type = map
}

variable "bucket_lambda_code" {
  description = "The bucket to store the lambda code"
  type        = string
}

variable "bucket_path_lambda_code" {
  description = "The bucket path to the lambda deployment package"
  type        = string
}

#### Optional Variables ####
variable "environment_variables" {
  description = "Map of environment variables"
  type = map
  default = null
}

variable "alias" {
  description = "The alias of the lambda function"
  type = string
  default = "LIVE"
}

variable "suffix" {
  description = "The suffix to append to all resources"
  type = string
  default = ""
}