provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "tf-test" {
    ami = var.ami_id
    instance_type = var.instance_type
    count = var.instance_count
  
}

resource "aws_s3_bucket" "tf-bucket" {
    bucket = "my-pks-static-bucket"

    tags = {
      Name        = "My bucket"
      Environment = "Dev"
    }
}

resource "aws_security_group" "tf-security" {
    name = "tf-allow-security-group"
    description = "Allow SSH and Other"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

  
}
terraform {
  backend "s3" {
    bucket = "my-pks-static-bucket"
    region = "ap-south-1"
    
  }
}