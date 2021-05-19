# curso-terraform-alura
Apendendo a usar o terraform

Modulo 1:
- Instalar terraform
```
choco install terraform
```
- Criar um usuario admin (com acesso total) para que possamos controlar a aws
- Gerar um par de chaves ssh local para que nao fiquemos presos a um provedor, e possa usar ela tbm em outras regioes da aws
```
ssh-keygen.exe -f terraform-aws -t rsa
```
- Mover a chave para a pasta default do ssh
```
mv ~\.ssh\
```
- Iniciar as configuracoes do terraform
```
terraform init
```
- Verificar se tudo esta de acordo, validar
```
terraform plan
```
- Aplicar configuracoes
```
terraform apply
```

Modulo 2:
- Criar security groups e realizar a conexao via ssh

Modulo 3:
- Adicionar variaveis
```
...
vpc_security_group_ids = [ "${aws_security_group.acesso-ssh.id}" ]
```
- Adiconar dependencias para na criacao
```
 depends_on = [
    aws_s3_bucket.dev4
  ]
```

Modulo 4
- Separar em varios arquivos para facilitar a compreencao
- Criar banco de dados

Modulo 5:
- Criar variaveis em um arquivo separado e com varios tipos
String (por default ja entende que quando nao adiciona tipo o ftipo sera string)
```
variable "instances" {
  default = "t2.micro"
}
```
Map 
```
variable "instances" {
  type = map
  default = {
      "test": "t2.micro"
  }
}
```
list
```
variable "cdirs_acesso_remoto" {
  type = list
  default = [
      "181.191.205.18/32"
  ]
}
```

Modulo 6:
- Apagar recursos
  Pode ser feito excluido os recursos e depois dar um plan e um apply normamlmente, mais recomendado, ou com o coamndo abaxio:
  ```
  terraform destroy --target <nome_recurso>
  ```
- Criar arquivos de outputs

Modulo 7:
- Criar arquivo terraform.rc na pasta ~\AppData\Roaming 
```
credentials "app.terraform.io" {
    token = "<token>"
}
```
- Criamos o arquivo remote-state
```
terraform {
    backend "remote" {
      hostname = "app.terraform.io"
      organization = "kralsdigital"

      workspaces {
          name = "aws-curso-alura"
      }
    }
}
```
- Adicionar as variaveis de ambiente da aws no terraform cloud, nao tem no curso, vi em tutorial por fora por conta do erro
```
Error: error configuring Terraform AWS Provider: no valid credential sources for Terraform AWS Provider found.
```
