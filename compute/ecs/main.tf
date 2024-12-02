module "autoScalingLaunchTemplate" {
  source = "../../autoScalingLaunchTemplate"  # Path to the autoscaling module
}
resource "aws_ecs_cluster" "tfer--admin-workflow-qa" {
  name = "admin-workflow-qa"

  setting {
    name  = "containerInsights"
    value = "disabled"
  }

  tags = {
    Resource-Type = "nonprod"
  }

  tags_all = {
    Resource-Type = "nonprod"
  }
}

resource "aws_ecs_cluster_capacity_providers" "tfer--capacity-provider" {
  cluster_name = aws_ecs_cluster.tfer--admin-workflow-qa.name

  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

  default_capacity_provider_strategy {
    base              = 1
    weight            = 100
    capacity_provider = "FARGATE"
  }
}

resource "aws_ecs_capacity_provider" "tfer--sg-managed-instances" {
  name = "sg-managed-instances"

  auto_scaling_group_provider {
    auto_scaling_group_arn         = module.autoScalingLaunchTemplate.aws_autoscaling_group-asg-instances-workflow-qa-arn
    managed_termination_protection = "DISABLED"

    managed_scaling {
      maximum_scaling_step_size = 1000
      minimum_scaling_step_size = 1
      status                    = "ENABLED"
      target_capacity           = 10
    }
  }
}
