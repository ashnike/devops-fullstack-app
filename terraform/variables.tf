variable "aws_region" {
  description = "The AWS region to deploy resources into"
  type        = string 
}
variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
}

variable "eks_vpc_cidr" {
  description = "The CIDR block for the EKS VPC."
  type        = string
}
variable "eks_priv_sub" {
  description = "List of private subnet CIDR blocks"
  type        = list(string)
}

variable "eks_pub_sub" {
  description = "List of public subnet CIDR blocks"
  type        = list(string)
}



variable "public_subnet_cidr_blocks" {
  description = "CIDR blocks for the public subnets"
  type        = list(string)

}

variable "private_subnet_cidr_blocks" {
  description = "CIDR blocks for the private subnets"
  type        = list(string)
 
}

variable "availability_zones" {
  description = "Availability zones for the subnets"
  type        = list(string)
 
}
variable "iam_policy_name" {
  type    = string
}

variable "role_name" {
  type    = string
}
variable "instance_profile_name" {
  description = "Instance profile name for Auto scaling Group"

}
variable "ami_id" {
  description = "The ID of the AMI to use for the instances"
  type        = string
}

variable "instance_type_jenkins" {
  description = "The instance type for the Jenkins instance"
  type        = string
}

variable "environment" {
  description = "Environment tag for the ECR repositories"
  type        = string
  default     = "dev"
}

variable "kops_bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "enable_versioning" {
  description = "Enable versioning on the S3 bucket"
  type        = bool
  default     = true
}
variable "ecr_repos" {
  type = list(string)
}
variable "tags" {
  description = "Tags to apply to the S3 bucket"
  type        = map(string)
  default     = {
    Name        = "kops"
    Environment = "Dev"
  }
}