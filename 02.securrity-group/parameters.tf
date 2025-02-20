resource "aws_ssm_parameter" "security_group_db" {
  name  = "/expense/dev/security_group_db"
  type  = "String"
  value = module.db.sg_information                                                ###db took from main.tf###
}


resource "aws_ssm_parameter" "security_group_backend" {
  name  = "/expense/dev/security_group_backend"
  type  = "String"
  value = module.backend.sg_information                                        ###backend took from main.tf###
}


resource "aws_ssm_parameter" "security_group_frontend" {
  name  = "/expense/dev/security_group_frontend"
  type  = "String"
  value = module.frontend.sg_information                                        ###frontend took from main.tf###
}


resource "aws_ssm_parameter" "security_group_bastion" {
  name  = "/expense/dev/security_group_bastion"
  type  = "String"
  value = module.bastion.sg_information                                        ###bastion took from main.tf###
}

resource "aws_ssm_parameter" "security_group_ansible" {
  name  = "/expense/dev/security_group_ansible"
  type  = "String"
  value = module.ansible.sg_information                                        ###ansible took from main.tf###
}



###sg_information took from module development terraform-aws-securitygroup output.tf############