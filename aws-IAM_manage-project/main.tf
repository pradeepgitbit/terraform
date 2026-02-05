terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.54.1"
    }
  }
}

provider "aws" {
    region = "ap-south-1"
}

locals {
  users_data = file("./users.yml")   #fetch the data and store here.
}

output "output" {
    value = local.users_data        #to see the output if it has captured the file
}