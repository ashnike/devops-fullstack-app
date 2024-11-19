resource "aws_ecr_repository" "repository" {
  count                = length(var.ecr_repos) # Create multiple repos based on input variable
  name                 = var.ecr_repos[count.index] # Name each repository from the list
  image_tag_mutability = "MUTABLE"

  tags = {
    Environment = var.environment
  }
}
