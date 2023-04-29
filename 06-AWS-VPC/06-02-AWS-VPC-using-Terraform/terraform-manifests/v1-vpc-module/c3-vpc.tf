# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.78.0"  
  # version = "~> 2.78"

  # VPC Basic Details
  name = "vpc-dev"
  cidr = "10.0.0.0/16"   
  azs                 = ["us-east-1a", "us-east-1b"]
  private_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets      = ["10.0.101.0/24", "10.0.102.0/24"]

  # Database Subnets
  create_database_subnet_group = true
  create_database_subnet_route_table= true
  database_subnets    = ["10.0.151.0/24", "10.0.152.0/24"]

  #create_database_nat_gateway_route = true
  #create_database_internet_gateway_route = true

  # NAT Gateways - Outbound Communication
  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support = true

  public_subnet_tags = {
    Type = "public-subnets"
  }

  private_subnet_tags = {
    Type = "private-subnets"
  }

  database_subnet_tags = {
    Type = "database-subnets"
  }

  tags = {
    Owner = "Abbey"
    Environment = "dev"
  }

  vpc_tags = {
    Name = "vpc-dev"
  }
}

######################################################################################################################################

  
  #Create VPC
#   module "vpc" {
#   source  = "terraform-aws-modules/vpc/aws//examples/complete"
#   version = "4.0.1"
# }

# module "vpc" {
#   source  = "terraform-aws-modules/vpc/aws"
#   version = "4.0.1"
# }

#   name = "vpv-dev"
#   cidr = "10.10.0.0/16"
#   azs             =   ["us-east-1a", "us-east-1b"]
#   private_subnets =   ["10.10.1.0/24", "10.10.2.0/24"]
#   public_subnets  =   ["10.10.3.0/24", "10.10.4.0/24",]

#   #Database
#   database_subnets  = ["10.10.5.0/24", "10.10.6.0/24"]
#   create_database_subnet_group = true
#   create_database_subnet_route_table = true
#   create_database_nat_gateway_route = false
#   create_database_internet_gateway_route = false

#   # NAT GW for outbound communication
#   enable_nat_gateway = true
#   single_nat_gateway = true

#   #VPC DNS Parameters
#   enable_dns_hostnames = true
#   enable_dns_support = true

#   #Tags
#   public_subnet_tags = {
#     Type = "public_subnets"
#   }
#   private_subnet_tags = {
#     Type = "private_subnets"
#     }
#     database_subnet_tags = {
#       Type = "database_subnets"
#     }
#      Owner = "dorfsky"
#      Environment = "dev"

#      vpc_tags = {
#       Name = "dev-vpc"
#      }
     
  

  