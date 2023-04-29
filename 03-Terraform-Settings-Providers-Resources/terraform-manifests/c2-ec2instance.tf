# Resource: EC2 Instance
resource "aws_instance" "web" {
  ami           = "ami-02f3f602d23f1659d"
  instance_type = "t3.micro"
  user_data     = file("${path.module}/app1-install.sh")                               #"../app1-install.sh"                                              
  tags = {
    "Name" = "EC2 Demo"
  }
}