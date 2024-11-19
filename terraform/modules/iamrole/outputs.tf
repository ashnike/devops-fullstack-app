output "instance_profile_name" {
  value       = aws_iam_instance_profile.ec2normal_profile.name
  description = "The name of the IAM instance profile for EC2"
}

output "role_name" {
  value       = aws_iam_role.ec2normal_webapp_role.name
  description = "The name of the IAM role for EC2"
}
