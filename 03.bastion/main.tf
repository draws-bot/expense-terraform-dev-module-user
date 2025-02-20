module "bastion" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  instance_type          = "t3.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.bastion_id.value]                 ###value only gives datasource ###
  subnet_id              = local.public_subnet_id
  ami = data.aws_ami.ami_id.id

  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-bastion"
    }
  )
}