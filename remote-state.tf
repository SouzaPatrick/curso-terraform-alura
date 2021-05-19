terraform {
    backend "remote" {
      hostname = "app.terraform.io"
      organization = "kralsdigital"

      workspaces {
          name = "aws-curso-alura"
      }
    }
}
