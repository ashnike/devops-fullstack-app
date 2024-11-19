# modules/ec2/outputs.tf

output "jenkins_public_ip" {
  value       = aws_instance.jenkins_instance.public_ip
  description = "Public IP of the Jenkins server"
}

output "private_key_path" {
  value       = "${path.root}/jenkins.pem"  # Ensure this matches your private key path
  description = "Path to the Jenkins server's private key"
}
