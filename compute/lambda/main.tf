resource "aws_lambda_function" "tfer--lambda-resource" {
  for_each =  var.lambdas
  architectures = ["x86_64"]
  environment {
    variables = each.value.environment_variables
  }
  ephemeral_storage {
    size = var.ephemeral_storage_size
  }
  function_name = each.value.function_name
  image_uri     = each.value.image_uri
  logging_config {
    log_format = var.log_format
    log_group  = each.value.log_group
  }
  memory_size                    = each.value.memory_size
  package_type                   = var.package_type
  reserved_concurrent_executions = var.reserved_concurrent_executions
  role                           = each.value.role
  skip_destroy                   = var.skip_destroy
  timeout                        = each.value.timeout
  tracing_config {
    mode = "PassThrough"
  }
}
