aws_region = "ap-south-1"
vpc_cidr_block = "10.0.0.0/16"
availability_zones = ["ap-south-1a", "ap-south-1b", "ap-south-1c"]
public_subnet_cidr_blocks  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidr_blocks = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

ecr_repos = [ "frontend", "backend" ]
iam_policy_name = "EC2-SSH1-policy"
role_name = "EC2-SSH1-role"
instance_profile_name = "EC2SSHprofile"
ami_id = "ami-00831800467f12dd1"
instance_type_jenkins = "t3.medium"
kops_bucket_name = "kopsbucc"


tags = {
  Name        = "My S3 Bucket"
  Environment = "Dev"
}
