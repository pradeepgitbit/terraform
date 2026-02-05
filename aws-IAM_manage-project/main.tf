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

#Creating users
resource "aws_iam_user" "users" {
    for_each = toset(local.users_data[*].username)
    name = each.value
}

#Password creation
resource "aws_iam_user_login_profile" "profile" {
    for_each = aws_iam_user.users
    user = each.value
    password_length = 12

    lifecycle {
      ignore_changes = [ 
        password_length,
        password_reset_required,
        pgp_key,
       ]
    }
  
}