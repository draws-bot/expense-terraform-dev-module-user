locals {
    public_subnet_id = element(split (",",data.aws_ssm_parameter.public_subnet_id.value),0)
    private_subnet_id = element(split (",",data.aws_ssm_parameter.private_subnet_id.value),0)
}