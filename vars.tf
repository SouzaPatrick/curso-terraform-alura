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

variable "key_pub" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC8wbRgzf6T42p2vnyaXgcdDc1uYIL7DSUn/AAfg4ym/SquEuDL4MWFYVHez/bGuc+pHapgQwjgwIPT20FJDpoAHt8br2hV7RJGBp+eKJOEkQXLJbB8eczZdjXm0L5HfjJccjpOP12UsAxr0xJ3IRB0k9qUSjrlWVanSZzr8s4icRQuD9dPqT+yZgSUIH+u8UrRMPYOECmTxIPYsMfgDT464mxWMGovylGJI2kMvq35y0QJp9R6SKkWGkDL1j4ux9u65BdiUNlJ5WnLfrtAflavp0bl5+qL4O8yxH8+9JTIjkhGOCBDgNs7Dxv5k+0WC0LrauOH0JzuSR+1NPDP+ec5TiWax9ICAf0JZ0TB4V+i98vIWE1VcJrlBHN0yS7VHTAw6cDl0ea+YR6tDQQGALC4d2H6UszPlGwDR0gur5Axpj7KoiKGzDocLlSAKsjT6vYYztGyOZ2+G+6pmR+brIXbLCMk/2sT9Hl860v2N3GheToo3GzofdOTyM0yNYkzQfE= felip@PATRICK-WIN10"
}