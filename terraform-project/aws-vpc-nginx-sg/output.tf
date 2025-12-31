output "aws_instance" {
    description = "instance-id"
    value = aws_instance.vpc-instance.id
  
}

output "aws_vpc" {
    description = "vpc id"
    value = aws_vpc.my-vpc.id
  
}

output "instance-public-ip" {
    description = "public ip"
    value = aws_instance.vpc-instance.public_ip
}

output "instance-url" {
    description = "url to access nginx server"
    value = "https://${aws_instance.vpc-instance.public_ip}"
  
}