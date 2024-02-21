resource "aws_lightsail_instance" "example_instance" {
  name              = "dev-instance"
  availability_zone = "us-east-1a"  # Change this to your desired availability zone
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_2_0"  # Change this to your desired Lightsail bundle
  key_pair_name     = "your-key-pair-name"  # Change this to your existing Lightsail key pair name

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>This Server is created using Terraform </h1>" | sudo tee /var/www/html/index.html
              EOF
}