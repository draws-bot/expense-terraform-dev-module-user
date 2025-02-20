output "vpc_information" {
    value = module.vpc_test.vpc_id                                       # "vpc_id"  took from our deveopment module of output.tf of terraform-aws-vpc module
}

output "vpc_peering" {
    value = module.vpc_test.vpc_peering                                 
}

###  "vpc_peering" took from our deveopment module  of terraform-aws-vpc vpc.tf check once ###