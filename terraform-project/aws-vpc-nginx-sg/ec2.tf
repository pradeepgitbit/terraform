provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_instance" "vpc-instance" {
    ami = var.ami
    instance_type = "t3.micro"
    subnet_id = aws_subnet.public-subnet.id
    vpc_security_group_ids = [ aws_security_group.vpc-nginx-sg.id]
    associate_public_ip_address = true

    user_data = <<EOF
#!/bin/bash
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
echo "Hello From Auto Scaling Group" >/var/www/html/index.html
EOF  

    tags = {
      Name = "Nginx-server"
    }
  
}

resource "aws_security_group" "vpc-nginx-sg" {
    vpc_id = aws_vpc.my-vpc.id
    description = "Nginx HTTP Acces"


    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "nginx-vpc-sg"
    }
  
}