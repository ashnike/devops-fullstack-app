# Define the IAM role for EC2
resource "aws_iam_role" "ec2normal_webapp_role" {
  name               = var.role_name
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Attach AmazonEC2RoleforSSM policy
resource "aws_iam_role_policy_attachment" "ec2_ssm_attachment" {
  role       = aws_iam_role.ec2normal_webapp_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}

# Attach AmazonSSMManagedInstanceCore policy
resource "aws_iam_role_policy_attachment" "ssm_managed_attachment" {
  role       = aws_iam_role.ec2normal_webapp_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Attach necessary policies to the EC2 role
resource "aws_iam_role_policy_attachment" "ec2_full_access_attachment" {
  role       = aws_iam_role.ec2normal_webapp_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_role_policy_attachment" "event_bridge_full_access_attachment" {
  role       = aws_iam_role.ec2normal_webapp_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess"
}

resource "aws_iam_role_policy_attachment" "route53_full_access_attachment" {
  role       = aws_iam_role.ec2normal_webapp_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonRoute53FullAccess"
}

resource "aws_iam_role_policy_attachment" "s3_full_access_attachment" {
  role       = aws_iam_role.ec2normal_webapp_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "sqs_full_access_attachment" {
  role       = aws_iam_role.ec2normal_webapp_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
}

resource "aws_iam_role_policy_attachment" "vpc_full_access_attachment" {
  role       = aws_iam_role.ec2normal_webapp_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}

resource "aws_iam_role_policy_attachment" "autoscaling_full_access_attachment" {
  role       = aws_iam_role.ec2normal_webapp_role.name
  policy_arn = "arn:aws:iam::aws:policy/AutoScalingFullAccess"
}

resource "aws_iam_role_policy_attachment" "iam_full_access_attachment" {
  role       = aws_iam_role.ec2normal_webapp_role.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}

# Create an IAM instance profile for EC2
resource "aws_iam_instance_profile" "ec2normal_profile" {
  name = var.instance_profile_name
  role = aws_iam_role.ec2normal_webapp_role.name
}
