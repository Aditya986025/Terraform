provider "aws" {
    region = "eu-north-1"
}

resource "aws_launch_template" "my-template" {
    name_prefix            = "my-template" 
    image_id = "ami-0d14d7177686c6058"
    instance_type = "t3.micro"
    key_name      = "Ubukey.pem"         # Replace with your key pair name
    vpc_security_group_ids = ["sg-09040ae4cd8504987"]


    user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install nginx -y
    echo "<h1> Hello World </h1>" > /var/www/html/index.html
    EOF

    tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "example-asg-instance"
    }
  }
}