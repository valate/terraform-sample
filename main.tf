provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/canonical-ubuntu-5.10-amd64-jammy-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["167357161503"] # Canonical
}

resource "aws_instance" "ubuntu" {
  ami           = data.aws_ami.ubuntu
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}
