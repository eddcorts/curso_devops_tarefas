## Aula 1 - Bash

Exercício 1: Script para comprimir

Conferível no arquivo `comprimir.sh`

---

Exercício 2: Instalar os pacotes de uma linguagem de programação e do Python

Exemplo de código para instalar as dependências do Python 3.13
```bash
sudo apt install python3.13
```

Exemplo de código para instalar as dependências do `dotnet`
```bash
sudo apt install ca-certificates libc6 libgcc-s1 libgssapi-krb5-2 libicu70 \
    liblttng-ust1 libssl3 libstdc++6 libunwind8 zlib1g

sudo add-apt-repository ppa:dotnet/backports

sudo apt-get update && sudo apt-get install -y dotnet-sdk-9.0
```

---

Exercício 3: Script para estrutura básica de API

Para a versão do Python, execute o script `novo_projeto_python.sh`.
Para a versão do .NET, execute o script `novo_projeto_dotnet.sh`.