provider "aws" {
    region = "ap-south-1"
}

module "vpc" {
    source = "./modules/vpc"
    cidr_block = "10.0.0.0/16"
    subnet_cidr = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
}

module "sg" {
    source = "./modules/sg"
    vpc_id = module.vpc.vpc_id
}

module "ec2" {
    source = "./modules/ec2"
    subnet_id = module.vpc.subnet_id
    security_group_id = module.sg.sg_id
    instance_name = "vpcwebserver"
  
}