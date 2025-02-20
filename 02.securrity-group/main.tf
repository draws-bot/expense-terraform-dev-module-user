module "db" {
##    source = "git::https://github.com/draws-bot/terrafrom-aws-securitygroup-moduledevelopment.git?ref=main"
    source = "../../terrafrom-aws-securitygroup-moduledevelopment"
    sg_description = "SG for DB MySQL Instances"
    vpc_id = data.aws_ssm_parameter.sg_id.value              ### value == vpc_id###
    project_name = var.project_name
    environment = var.environment
    common_tags = var.common_tags
    sg_name = "db"
}


module "backend" {
##    source = "git::https://github.com/draws-bot/terrafrom-aws-securitygroup-moduledevelopment.git?ref=main"
    source = "../../terrafrom-aws-securitygroup-moduledevelopment"
    sg_description = "SG for BACKEND MySQL Instances"
    vpc_id = data.aws_ssm_parameter.sg_id.value                         ### value == vpc_id###
    project_name = var.project_name
    environment = var.environment
    common_tags = var.common_tags
    sg_name = "backend"
}


###your can see here all are seperate modules for db,backend,frontend that why it creates security_groups####


module "frontend" {
##    source = "git::https://github.com/draws-bot/terrafrom-aws-securitygroup-moduledevelopment.git?ref=main"
    source = "../../terrafrom-aws-securitygroup-moduledevelopment"
    sg_description = "SG for frontend MySQL Instances"
    vpc_id = data.aws_ssm_parameter.sg_id.value                         ### value == vpc_id###
    project_name = var.project_name
    environment = var.environment
    common_tags = var.common_tags
    sg_name = "frontend"
}

module "bastion" {
##    source = "git::https://github.com/draws-bot/terrafrom-aws-securitygroup-moduledevelopment.git?ref=main"
    source = "../../terrafrom-aws-securitygroup-moduledevelopment"
    sg_description = "SG for bastion MySQL Instances"
    vpc_id = data.aws_ssm_parameter.sg_id.value                         ### value == vpc_id###
    project_name = var.project_name
    environment = var.environment
    common_tags = var.common_tags
    sg_name = "bastion"
}

module "ansible" {
##    source = "git::https://github.com/draws-bot/terrafrom-aws-securitygroup-moduledevelopment.git?ref=main"
    source = "../../terrafrom-aws-securitygroup-moduledevelopment"
    sg_description = "SG for ansible MySQL Instances"
    vpc_id = data.aws_ssm_parameter.sg_id.value                         ### value == vpc_id###
    project_name = var.project_name
    environment = var.environment
    common_tags = var.common_tags
    sg_name = "ansible"
}


### db is connecting backend goggle it as terrafrom security_group ###


resource "aws_security_group_rule" "db_backend" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = module.backend.sg_information           # source is where you are getting traffic from
  security_group_id = module.db.sg_information
}

resource "aws_security_group_rule" "db_bastion" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_information           # source is where you are getting traffic from bastion here "db" means rds ####
  security_group_id = module.db.sg_information
}


###backend accepting connection from source###

resource "aws_security_group_rule" "backend_frontend" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "tcp"
  source_security_group_id = module.frontend.sg_information            # source is where you are getting traffic from
  security_group_id = module.backend.sg_information
}

resource "aws_security_group_rule" "backend_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_information            # source is where you are getting traffic from
  security_group_id = module.backend.sg_information
}

resource "aws_security_group_rule" "backend_ansible" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.ansible.sg_information            # source is where you are getting traffic from
  security_group_id = module.backend.sg_information
}


###frontend accepting connection from source###

resource "aws_security_group_rule" "frontend_pulic" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]                            # source is where you are getting traffic from
  security_group_id = module.frontend.sg_information
}

resource "aws_security_group_rule" "frontend_bastion" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.bastion.sg_information          # source is where you are getting traffic from
  security_group_id = module.frontend.sg_information
}


resource "aws_security_group_rule" "frontend_ansible" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  source_security_group_id = module.ansible.sg_information           # source is where you are getting traffic from
  security_group_id = module.frontend.sg_information
}

##bastion accepting connection from source###


resource "aws_security_group_rule" "bastion_public" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]                                        #### source is where you are getting traffic from
  security_group_id = module.bastion.sg_information
}

##ansible accepting connection from source###

resource "aws_security_group_rule" "ansible_public" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]                                                 # source is where you are getting traffic from
  security_group_id = module.ansible.sg_information
}