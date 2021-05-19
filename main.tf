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

provider "aws" {
  alias = "us-east-2"
  region = "us-east-2"
}

resource "aws_key_pair" "terraform_aws" {
  key_name = "terraform-aws"
  public_key = var.key_pub
}

resource "aws_instance" "dev" {
  count = 3
  ami = var.amis["us-east-1"]
  instance_type = var.instances["test"]
  key_name = "${aws_key_pair.terraform_aws.key_name}"
  tags = {
    "Name" = "dev${count.index}"
  }
  vpc_security_group_ids = [ "${aws_security_group.acesso-ssh.id}" ]
}

resource "aws_instance" "dev4" {
  ami = var.amis["us-east-1"]
  instance_type = var.instances["test"]
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
  ami = var.amis["us-east-1"]
  instance_type = var.instances["test"]
  key_name = "${aws_key_pair.terraform_aws.key_name}"
  tags = {
    "Name" = "dev5"
  }
  vpc_security_group_ids = [ "${aws_security_group.acesso-ssh.id}" ]
}

resource "aws_instance" "dev6" {
  provider = aws.us-east-2
  ami = var.amis["us-east-2"]
  instance_type = var.instances["test"]
  key_name = "${aws_key_pair.terraform_aws.key_name}"
  tags = {
    "Name" = "dev6"
  }
  vpc_security_group_ids = [ "${aws_security_group.acesso-ssh-us-east-2.id}" ]
  depends_on = [
    aws_dynamodb_table.dynamodb-homologacao
  ]
}

resource "aws_instance" "dev7" {
  provider = aws.us-east-2
  ami = var.amis["us-east-2"]
  instance_type = var.instances["test"]
  key_name = "${aws_key_pair.terraform_aws.key_name}"
  tags = {
    "Name" = "dev7"
  }
  vpc_security_group_ids = [ "${aws_security_group.acesso-ssh-us-east-2.id}" ]
}

resource "aws_instance" "homologacao" {
  provider = aws.us-east-2
  ami = var.amis["us-east-2"]
  instance_type = var.instances["test"]
  key_name = "${aws_key_pair.terraform_aws.key_name}"
  tags = {
    "Name" = "homologacao"
  }
  vpc_security_group_ids = [ "${aws_security_group.acesso-ssh-us-east-2.id}" ]
}

resource "aws_s3_bucket" "dev4" {
  bucket = "call4fit-dev4"
  acl    = "private"

  tags = {
    Name = "call4fit-dev4"
  }
}

resource "aws_s3_bucket" "homologacao" {
  bucket = "call4fit-homologacao"
  acl    = "private"

  tags = {
    Name = "call4fit-homologacao"
  }
}

resource "aws_dynamodb_table" "dynamodb-homologacao" {
  provider = aws.us-east-2
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }

}