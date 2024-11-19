#!/usr/bin/env python3

import json

# Load Terraform output JSON
with open('terraform_output.json') as f:
    terraform_output = json.load(f)

# Extract the public IP and private key path
public_ip = terraform_output['jenkins_public_ip']['value']
private_key_path = terraform_output['private_key_path']['value']

# Define the content for Ansible inventory
inventory_content = f"""
[jenkins]
{public_ip} ansible_user=ubuntu ansible_ssh_private_key_file={private_key_path}
"""

# Write the inventory content to hosts.ini
with open('ansible/inventory/hosts.ini', 'w') as f:
    f.write(inventory_content)

print("Ansible inventory updated with EC2 instance details!")
