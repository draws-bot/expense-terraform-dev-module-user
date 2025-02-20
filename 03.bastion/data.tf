data "aws_ssm_parameter" "bastion_id" {                               
  name = "/expense/dev/security_group_bastion"
}

data "aws_ssm_parameter" "public_subnet_ids" {                               
  name = "/expense/dev/public_subnet_ids"
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
