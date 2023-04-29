resource "aws_instance" "Demoserver" {
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_Keypair
  #create each ec2 instance in each az
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  count = 6
    user_data = <<-EOF
  #     #! /bin/bash
  Instance Identity Metadata Reference - https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-identity-documents.html
  sudo yum update -y
  sudo yum install -y httpd
  sudo systemctl enable httpd
  sudo service httpd start  
  sudo echo '<h1>Welcome to StackSimplify - APP-1</h1>' | sudo tee /var/www/html/index.html
  sudo mkdir /var/www/html/app1
  sudo echo '<!DOCTYPE html> <html> <body style="background-color:rgb(250, 210, 210);"> <h1>Welcome to Stack Simplify - APP-1</h1> <p>Terraform Demo</p> <p>Application Version: V1</p> </body></html>' | sudo tee /var/www/html/app1/index.html
  sudo curl http://169.254.169.254/latest/dynamic/instance-identity/document -o /var/www/html/app1/metadata.html
  EOF
  tags = {
    Name = "Ec2 Demo"
  }
}
  