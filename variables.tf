variable "ami_id" {
    type = string
    description = "this is ami id for AL2 in ap-south-1"
    default = "ami-00ca570c1b6d79f36"
}

variable "instance_type" {
    type = string
    description = "this is type of instance"
    default = "t3.micro"
  
}
variable "instance_count" {
    type = number
    description = "this is the no. of instances to create"
    default = 1
  
}