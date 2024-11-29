variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
  default = "vpc-0f86be5ff5b724c7c"
}

variable "security_group_name" {
  description = "The VPC ID where the security group will be created"
  type        = string
  default = "test-qa-prod1"
}

variable "launch_template_name" {
  description = "The name prefix for the launch template"
  type        = string
  default = "test-template-prod1"
}

variable "ami_id" {
  description = "The AMI ID to use for the instances"
  type        = string
  default = "ami-02141377eee7defb9"
}

variable "instance_type" {
  description = "The instance type to use"
  type        = string
  default = "t2.micro"
}

variable "desired_capacity" {
  description = "The desired number of instances"
  type        = number
  default = 0
}

variable "max_size" {
  description = "The maximum number of instances"
  type        = number
  default = 0
}

variable "min_size" {
  description = "The minimum number of instances"
  type        = number
  default = 0
}

variable "subnet_id" {
  description = "A list of subnet IDs for the ASG"
  type        = string
  default = "subnet-06731a6f7ea8a093f"
}

variable "aws_autoscaling_group_name" {
  description = "The name prefix for the launch template"
  type        = string
  default = "test-autoscale-prod1"
}
