variable "amis" {
  type = map
  default = {
      "us-east-1" = "ami-0747bdcabd34c712a"
      "us-east-2" = "ami-00399ec92321828f5"
  }
}

variable "cdirs_acesso_remoto" {
  type = list
  default = [
      "181.191.205.18/32"
  ]
}

variable "instances" {
  type = map
  default = {
      "test": "t2.micro"
  }
}