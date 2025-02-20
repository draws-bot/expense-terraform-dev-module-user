data "aws_ssm_parameter" "db_sg_id" {
  name =  "/expense/dev/security_group_db"
}

data "aws_ssm_parameter" "db_subnet_group_name" {
  name = "/expense/dev/database_subnet_group_name"
}