output "aws_security_group-sg-workflow-qa" {
  value = aws_security_group.tfer--sg-workflow-qa.id
}

output "aws_launch_template-ecs-instance-workflow-qa" {
  value = aws_launch_template.tfer--ecs-instance-workflow-qa.id
}

output "aws_autoscaling_group-asg-instances-workflow-qa" {
  value = aws_autoscaling_group.tfer--asg-instances-workflow-qa.id
}

output "aws_autoscaling_group-asg-instances-workflow-qa-arn" {
  value = aws_autoscaling_group.tfer--asg-instances-workflow-qa.arn
}
