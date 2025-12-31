output "instance_id" {
    description = "this is the id of the instance"
    value = aws_instance.tf-test[0].id
  
}

output "public_ip" {
    description = "this is the public ip"
    value = aws_instance.tf-test[0].public_ip
  
}

output "public_dns" {
    description = "this the public dns"
    value = aws_instance.tf-test[0].public_dns
  
}