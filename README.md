# curso-terraform-alura
Apendendo a usar o terraform

Modulo 1:
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