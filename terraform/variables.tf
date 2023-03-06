#### Required Variables ####
variable "function_name" {
  description = "The name of the lambda function"
  type        = string
}

variable "handler" {
  description = "The lambda function handler"
  type        = string
}

variable "runtime" {
  description = "The lambda function runtime"
  type        = string
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
  type        = map(any)
  default     = null
}

variable "alias" {
  description = "The alias of the lambda function"
  type        = string
  default     = "LIVE"
}

variable "suffix" {
  description = "The suffix to append to all resources"
  type        = string
  default     = ""
}

variable "timeout" {
  description = "Lambda timeout in seconds"
  type        = number
  default     = 60
}

variable "memory_size" {
  description = "The lambda memory size"
  type        = number
  default     = 128
}