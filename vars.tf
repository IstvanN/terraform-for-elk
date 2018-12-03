variable "aws_access_key" {
  description = "AWS access key"
}
variable "aws_secret_key"  {
  description = "AWS secret key"
}
variable "region" {
  description = "AWS region to be used"
}
variable "aws_ami" {
  description = "AMI ID to use"
}
variable "aws_instance_type" {
  description = "With this config, I'm trying to use ELK Stack on a t2.micro"
}
variable "aws_private_key_name" {
  description = "AWS private key for authentication"
}
variable "aws_public_key" {
  description = "AWS private key's public pair"
}
variable "userdata" {
  description = "Script to install Elasticsearch and Kibana and starting them"
  default = <<-HEREDOC
  #!/bin/bash
  wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
  echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-6.x.list
  sudo apt update
  sudo apt install -y default-jre
  sudo apt install -y kibana
  sudo apt install -y elasticsearch
  sudo apt install rsyslog-elasticsearch
  sudo service start kibana
  sudo service start elasticsearch
  HEREDOC
}
