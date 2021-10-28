provider "aws" {
    region="us-east-1"
}

variable "vpc_id" {
  type=string
}

module "shared_vars" {
  vpc_id="${var.vpc_id}"
  source="./shared_vars"
}

# module "network_module" {
#   vpc_id="${module.shared_vars.vpc_id}"
#   source = "./network_module"
# }

module "ec2_module" {
 
  source = "./ec2_module"
}

