variable "environment" {
  description = "Environment tag for the ECR repositories"
  type        = string
  default     = "dev"
}
variable "ecr_repos" {
  type = list(string)
}