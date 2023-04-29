#Input Variable
#AWS region
variable "aws_region" {
  type        = string
  description = "Region where resource will be created"
  default     = "us-east-1"
}

#instance_type
variable "instance_type" {
  type        = string
  description = "ec2 instance type"
  default     = "t3.micro"
}

#Key pair
variable "instance_Keypair" {
  type        = string
  description = "instance key pair"
  default     = "Novakeypair"

}



