# environments/backend/outputs.tf

output "jenkins_public_ip" {
  value = module.ec2_instance.jenkins_public_ip  # Reference the EC2 module output
}

output "private_key_path" {
  value = module.ec2_instance.private_key_path  # Reference the EC2 module output
}
