module "vpc_test" {
#   source = "../terrafrom-aws-vpc"
   source = "git::https://github.com/draws-bot/terraform-aws-vpc.git?ref=main"     ###it will clone all our module devolpment sources ####
   common_tags = var.common_tags
   public_subnet_cidr = var.public_subnet_cidrs                    #public_subnet_cidr took from aws_vpc variable.tf
   private_subnet_cidr = var.private_subnet_cidrs
   database_subnet_cidr = var.database_subnet_cidrs
   is_peering_required = var.is_peering_required
}
