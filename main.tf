provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.region}"
  version = "1.50"
}

resource "aws_instance" "web" {
  ami = "${var.aws_ami}"
  instance_type = "${var.aws_instance_type}"
  key_name = "${var.aws_private_key_name}"
  security_groups = ["terraform-elk"]
  user_data = "${var.userdata}"

  tags {
    Name = "ELK Stack On Diet"
  }
}

resource "aws_key_pair" "elk-on-diet" {
    key_name = "${var.aws_private_key_name}"
    public_key = "${var.aws_public_key}"
}
