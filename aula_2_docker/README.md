## Aula 2 - Docker

#### Exercício 1: Executar uma instância do sonarqube.

Nomeando o container de sonarqube e pareando as portas 9000:

```bash
docker run --name sonarqube -e SONAR_ES_BOOTSTRAP_CHECKS_DISABLE=true -p 9000:9000 sonarqube:latest
```

---

#### Exercício 2: Utilizar a imagem sonarsource/sonar-scanner-cli para escanear um projeto e gerar o relatório no sonarqube instanciado anteriormente.

Primeiramente, tendo o container do sonarqube já em execução com o comando anterior, é necessário obter seu IP dentro da rede interna do docker (que não é a partir do `https://host.docker.internal` para sistemas que não possuem o Docker Desktop instalado). Para isso, basta inspecionar a instância do Docker e descobrir seu IP.

```bash
IP_SONAR=$(docker inspect sonarqube | grep '"IPAddress":' | head -n 1 | awk -F '"' '{print $4}')
```

Durante a execução desta tarefa, o IP em questão foi `172.17.0.2`.

Ainda, após ter configurado o projeto dentro do Sonarqube, é necessário gerar e adquirir a project key.

Por fim, o comando está dentro do script `escanear.sh`, com as variáveis de acordo com a execução da tarefa.

---

#### Exercício 3: Reconfigurar o sonarqube para utilizar um banco de dados PostgreSQL rodando em docker com um usuário configurado via variáveis de ambiente.

O arquivo `compose.yaml` configura uma instância do Sonarqube para executar em conjunto com o banco de dados PostgreSQL.

Não são utilizados volumes para persistir os dados, visando apenas uma prova de conceito de execução dos containers de forma a se comunicarem.

Para executar: `docker compose -p aula_2_docker --file compose.yaml up`

---

#### Exercício 4: Prepare um Dockerfile para uma aplicação na linguagem que costuma utilizar.

e

#### Exercício 5: Prepare um docker compose para uma aplicação utilizando um container de banco de dados, um container da sua aplicação, variáveis de ambiente, expondo portas e outros recursos de configuração.

Estes exercícios podem ser verificados no [repositório da API de receitas](https://github.com/eddcorts/curso_devops_tarefas/tree/main), da pré-tarefa do curso.

Lá, há o arquivo `compose.yaml`, que configura uma instância NginX para servir de proxy para o container da API.

O exercício foi acordado em focar na comunicação entre containers, ao invés do banco de dados, visto que a aplicação no momento é feita armazenando os dados em memória ao invés da persistência em banco.

Para executar: `docker compose -p api_receitas --file compose.yaml up`
