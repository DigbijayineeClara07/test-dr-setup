# --------------------------------------------------------------------------------------------------
# Security Groups for launch template
# --------------------------------------------------------------------------------------------------
resource "aws_security_group" "tfer--sg-workflow-qa" {
  name        = var.security_group_name
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_egress_rule" "tfer--sg-egress-workflow-qa" {
  security_group_id = aws_security_group.tfer--sg-workflow-qa.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 0
  ip_protocol = "tcp"
  to_port     = 0
}

resource "aws_vpc_security_group_ingress_rule" "tfer--sg-ingress-workflow-qa" {
  security_group_id = aws_security_group.tfer--sg-workflow-qa.id

  cidr_ipv4   = "10.0.0.0/24"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

# --------------------------------------------------------------------------------------------------
# launch template 
# --------------------------------------------------------------------------------------------------
resource "aws_launch_template" "tfer--ecs-instance-workflow-qa" {
  name = var.launch_template_name

  block_device_mappings {
    device_name = "/dev/xvda"

    ebs {
      delete_on_termination = true
      encrypted = false
      iops = 3000
      throughput = 125
      volume_size = 100
      volume_type = "gp3"
    }
  }
   network_interfaces {
    subnet_id = var.subnet_id
    security_groups = [aws_security_group.tfer--sg-workflow-qa.id]
  }
  disable_api_stop = false
  disable_api_termination = false
  iam_instance_profile {
    arn =  "arn:aws:iam::790543352839:instance-profile/AmazonEC2ContainerServiceforEC2Role"
  }
  image_id = var.ami_id

  instance_initiated_shutdown_behavior = "stop"

  instance_type = var.instance_type

  key_name = "binaya-nonprod"

  tag_specifications {
    resource_type = "instance"

    tags = {
      Resource-Type = "nonprod"
    }
  }
  tag_specifications {
    resource_type = "volume"

    tags = {
      Resource-Type = "nonprod"
    }
  }
  tag_specifications {
    resource_type = "network-interface"

    tags = {
      Resource-Type = "nonprod"
    }
  }
    tags = {
      Resource-Type = "nonprod"
    }
    tags_all = {
      Resource-Type = "nonprod"
    }
  
  user_data = filebase64("${path.module}/user_data.sh")
}

# --------------------------------------------------------------------------------------------------
# ASG 
# --------------------------------------------------------------------------------------------------
resource "aws_autoscaling_group" "tfer--asg-instances-workflow-qa" {
  name = var.aws_autoscaling_group_name
  capacity_rebalance  = false
  health_check_type   = "EC2"
  default_cooldown = 300
  availability_zones = ["eu-west-1a"]
  desired_capacity   = 0
  max_size           = 3
  min_size           = 0
  #vpc_zone_identifier       = ["subnet-04d9a8cd86a363a76"]
  enabled_metrics = [
      "GroupAndWarmPoolDesiredCapacity",
      "GroupAndWarmPoolTotalCapacity",
      "GroupDesiredCapacity",
      "GroupInServiceCapacity",
      "GroupInServiceInstances",
      "GroupMaxSize",
      "GroupMinSize",
      "GroupPendingCapacity",
      "GroupPendingInstances",
      "GroupStandbyCapacity",
      "GroupStandbyInstances",
      "GroupTerminatingCapacity",
      "GroupTerminatingInstances",
      "GroupTotalCapacity",
      "GroupTotalInstances",
      "WarmPoolDesiredCapacity",
      "WarmPoolMinSize",
      "WarmPoolPendingCapacity",
      "WarmPoolTerminatingCapacity",
      "WarmPoolTotalCapacity",
      "WarmPoolWarmedCapacity"
  ]

  launch_template {
    id      = aws_launch_template.tfer--ecs-instance-workflow-qa.id
    version = "$Latest"
  }
}
