resource "aws_vpc" "sg-prod-test" {
  assign_generated_ipv6_cidr_block = "false"
  cidr_block                       = "172.24.128.0/18"
  enable_dns_hostnames             = "true"
  enable_dns_support               = "true"
  instance_tenancy                 = "default"

  tags = {
    Name       = "sg-prod"
    SG-Managed = "Do-Not-Modify-Delete-Created-By-StackGuardian"
    Resource-Type = "prod"
  }

  tags_all = {
    Name       = "sg-prod"
    SG-Managed = "Do-Not-Modify-Delete-Created-By-StackGuardian"
    Resource-Type = "prod"
  }
}
