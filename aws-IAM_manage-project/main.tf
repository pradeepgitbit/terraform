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
  users_data = yamldecode(file("./users.yml")).users  #fetch the data and store here.
}                                                # added yamldecode to change the format && added .users

output "output" {
    value = local.users_data[*].username        #to see the output if it has captured the file
}

resource "aws_iam_user" "main" {
    for_each = toset(local.users_data[*].username)
    name = each.value
}