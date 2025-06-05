
variable "name_prefix" {}
variable "function_suffix" {}
variable "filename" {}
variable "handler" {}
variable "runtime" {
  default = "python3.9"
}
variable "lambda_role_arn" {}
