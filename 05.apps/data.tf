data "aws_ssm_parameter" "backend_sg_id" {
  name  = "/expense/dev/security_group_backend"
}


data "aws_ssm_parameter" "frontend_sg_id" {
  name  = "/expense/dev/security_group_frontend"
}



data "aws_ssm_parameter" "ansible_sg_id" {
  name  = "/expense/dev/security_group_ansible"
}

data "aws_ssm_parameter" "private_subnet_id" {
  name  = "/expense/dev/private_subnet_ids"
}


data "aws_ssm_parameter" "public_subnet_id" {
  name  = "/expense/dev/public_subnet_ids"
}


 ###ami_id####


data "aws_ami" "ami_id" {
  most_recent = true

  owners = ["973714476881"]
    
  filter {
     name   = "name"
     values = ["RHEL-9-DevOps-Practice"]
   }

   filter {
      name   = "virtualization-type"
     values = ["hvm"]
    }

    filter {
      name = "root-device-type"
      values = ["ebs"]
    }
}




