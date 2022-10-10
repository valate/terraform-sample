provider "aws" {
  region = var.region
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["CIS Ubuntu Linux 18.04 LTS Benchmark v1.0.0.* - Level 1-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners =["679593333241"]
}

resource "aws_instance" "ubuntu" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
