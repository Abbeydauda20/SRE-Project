# ami Data source
data "aws_ami" "amzlinux2" {
  most_recent      = true
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# Declare the data source
data "aws_availability_zones" "my-azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}