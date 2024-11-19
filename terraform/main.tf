module "vpc" {
  source                       = "./modules/vpc"
  vpc_cidr_block               = var.vpc_cidr_block
  public_subnet_cidr_blocks    = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks   = var.private_subnet_cidr_blocks
  availability_zones           = var.availability_zones
}

# IAM Role for EC2
module "aws_iam_role" {
  depends_on            = [module.vpc]
  source                = "./modules/iamrole"
  role_name             = var.role_name
  iam_policy_name       = var.iam_policy_name
  instance_profile_name = var.instance_profile_name
}

# EC2 Instance Module
module "ec2_instance" {
  depends_on            = [module.vpc, module.aws_iam_role]
  source                = "./modules/ec2"
  vpc_id                = module.vpc.vpc_id
  public_subnet_ids     = module.vpc.public_subnet_ids
  instance_profile_name = module.aws_iam_role.instance_profile_name
  ami_id                = var.ami_id
  instance_type_jenkins = var.instance_type_jenkins
}


module "ecr" {
  source = "./modules/ecr"
  ecr_repos = var.ecr_repos # List of ECR repositories to create
  environment = var.environment 
}
module "s3" {
  source = "./modules/s3"
  kops_bucket_name = var.kops_bucket_name
  tags = var.tags
}