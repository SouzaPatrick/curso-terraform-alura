terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.0"
        }
    }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "terraform_aws" {
  key_name = "terraform-aws"
  public_key = "${file("C:\\Users\\Felip\\.ssh\\terraform-aws.pub")}"
}

resource "aws_instance" "dev" {
  count = 3
  ami = "ami-0747bdcabd34c712a"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.terraform_aws.key_name}"
  tags = {
    "Name" = "dev${count.index}"
  }
  vpc_security_group_ids = [ "${aws_security_group.acesso-ssh.id}" ]
}

resource "aws_instance" "dev4" {
  ami = "ami-0747bdcabd34c712a"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.terraform_aws.key_name}"
  tags = {
    "Name" = "dev4"
  }
  vpc_security_group_ids = [ "${aws_security_group.acesso-ssh.id}" ]
  depends_on = [
    aws_s3_bucket.dev4
  ]
}

resource "aws_instance" "dev5" {
  ami = "ami-0747bdcabd34c712a"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.terraform_aws.key_name}"
  tags = {
    "Name" = "dev5"
  }
  vpc_security_group_ids = [ "${aws_security_group.acesso-ssh.id}" ]
}

resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["181.191.205.18/32"]
  }

  tags = {
    Name = "ssh"
  }
}

resource "aws_s3_bucket" "dev4" {
  bucket = "call4fit-dev4"
  acl    = "private"

  tags = {
    Name = "call4fit-dev4"
  }
}