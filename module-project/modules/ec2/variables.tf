variable "ami_id" {
    description = "ami id for this instance"
    default = "ami-00ca570c1b6d79f36"
  
}

variable "instance_type" {
    description = "type of instance"
    default = "t3.micro"
}

variable "subnet_id" {
    description = "subnet id under which this instance created"
  
}

variable "security_group_id" {
    description = "Security group for this instance"
  
}
variable "instance_name" {
    description = "name"
  
}