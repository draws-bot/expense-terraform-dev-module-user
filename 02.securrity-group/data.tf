data "aws_ssm_parameter" "sg_id" {                                ###we are fetching vpc_id from datasource
  name = "/expense/dev/vpc_id"
}