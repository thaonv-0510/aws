resource "aws_vpc" "lab-architect-vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"

    tags = {
      Name = "lab-architect-vpc"
    }
}
