resource "aws_ssm_parameter" "vpc" {
  name        = "/expense/dev/vpc_id"
  type        = "String"
  value       = module.vpc_test.vpc_id          ###vpc_id taken from module development output.tf check once###                  
}


resource "aws_ssm_parameter" "public_subnet_ids" {
  name  = "/expense/dev/public_subnet_ids"
  type  = "String"
  value = join("," ,module.vpc_test.vpc_publicsubnet_id)                    ####vpc_publicsubnet_id is taken from module development at output.tf###
}


resource "aws_ssm_parameter" "private_subnet_ids" {
  name  = "/expense/dev/private_subnet_ids"
  type  = "String"
  value = join("," ,module.vpc_test.vpc_privatesubnet_id)                     ####vpc_publicsubnet_id is taken from module development at output.tf###
}





resource "aws_ssm_parameter" "db_subnet_group_name" {
  name  = "/expense/dev/database_subnet_group_name"
  type  = "String"
  value = module.vpc_test.database_subnet_group_name
}


