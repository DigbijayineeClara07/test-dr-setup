variable "region" {
   type = string
   default = "eu-west-1"
 }

 variable "lambdas" {
   description = "A map of Lambda configurations"
   type = map(object({
     function_name         = string
     image_uri             = string
     log_group             = string
     role                  = string
     environment_variables = map(string)
     memory_size           = number
     timeout               = number
   }))
 }

 variable "ephemeral_storage_size" {
   description = "The ephemeral storage size for the Lambda function"
   type        = number
   default     = 512
 }

 variable "reserved_concurrent_executions" {
   description = "The reserved concurrent executions for the Lambda function"
   type        = string
   default     = "-1"
 }

 variable "skip_destroy" {
   description = "Whether to skip destroy when removing the function"
   type        = string
   default     = "false"
 }

 variable "log_format" {
   type = string #Select either Text or JSON
   default = "Text"
 }

 variable "package_type" {
   type = string
   default = "Image"
 } 
