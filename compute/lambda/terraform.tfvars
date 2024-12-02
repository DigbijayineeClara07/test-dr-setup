 #this is just an example how a terraform.tfvars file can look like for the lambdas variable
 lambdas = {
    "cognito_post_confirmation_lambda" = {
      function_name         = "cognito-post-authentication"
      image_uri             = "790543352839.dkr.ecr.eu-central-1.amazonaws.com/cognito/post-authentication-aes:latest"
      log_format            = "Text"
      log_group             = "/aws/lambda/cognito-post-confirmation"
      role                  = "arn:aws:iam::790543352839:role/cognito-post-confirmation-lambda"
      environment_variables = {
        SSO_USER_POOL_ID = "eu-central-1_C6bwuggLI"
      }
      memory_size           = "128"
      timeout               = "1"
    },
    "cognito_pre_signup" = {
      function_name         = "cognito-pre-signup-test-clara"
      image_uri             = "790543352839.dkr.ecr.eu-central-1.amazonaws.com/cognito/pre-signup:1709053827"
      log_format            = "Text"
      log_group             = "/aws/lambda/cognito-pre-signup"
      role                  = "arn:aws:iam::790543352839:role/cognito-pre-signup-lambda"
      environment_variables = {
        CLIENT_ID        = "6h75tpe7ab0m2dj309b3bmcvbu"
        SSO_USER_POOL_ID = "eu-central-1_2VRD7q6Vu"
        USER_POOL_ID     = "eu-central-1_C6bwuggLI"
      }
      memory_size           = "128"
      timeout               = "15"
    },
    "lambda_resource" = {
      function_name         = "scheduled-workflow-run-trigger-test-clara"
      image_uri             = "790543352839.dkr.ecr.eu-central-1.amazonaws.com/scheduled-workflow-run-trigger:latest"
      role                  = "arn:aws:iam::790543352839:role/service-role/workflow-run-scheduler-role-37ti6mgi"
      log_format            = "Text"
      log_group             = "/aws/lambda/scheduled-workflow-run-trigger"
      environment_variables = {}
      memory_size           = "256"
      timeout               = "900"
    }
  }
