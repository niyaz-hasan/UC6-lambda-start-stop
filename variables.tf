
variable "start_schedule" {
  default = "cron(0 3 * * ? *)"
}

variable "stop_schedule" {
  default = "cron(0 12 * * ? *)"
}
