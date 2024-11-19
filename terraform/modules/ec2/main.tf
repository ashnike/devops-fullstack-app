resource "tls_private_key" "pri_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "keypair" {
  key_name   = "pipelines"
  public_key = tls_private_key.pri_key.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.pri_key.private_key_pem}' > ./jenkins.pem"
  }
}

# Use VPC and subnets from the module
resource "aws_instance" "jenkins_instance" {
  ami             = var.ami_id
  instance_type   = var.instance_type_jenkins
  subnet_id       = var.public_subnet_ids[0] 
  security_groups = [aws_security_group.jenkins_sg.id]
  key_name        = aws_key_pair.keypair.key_name
  iam_instance_profile = var.instance_profile_name
  depends_on = [aws_security_group.jenkins_sg]
  root_block_device {
    volume_size = 30  
    volume_type = "gp2"  
  }
  tags = {
    Name = "jenkins-server"  
    Project     = "jenkins"
  }
}


resource "aws_security_group" "jenkins_sg" {
  vpc_id = var.vpc_id 
  name        = "jenkins-sg" 
  description = "jenkins server sg"
  // Inbound rules for Jenkins
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  // Inbound rules for SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Outbound rule for all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
