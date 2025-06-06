## Aula 6 - Github Actions

Os arquivos referidos aqui estão presentes no [repositório da API da pré-tarefa](https://github.com/eddcorts/curso_devops_tarefas/tree/main).

#### Exercício 1: Você criou um GitHub Actions que roda o lint no PR

O arquivo referente está presente em [`.github/workflows/lint_pr.yml`](https://github.com/eddcorts/curso_devops_receitas/blob/v1.2/.github/workflows/lint_pr.yml).

Está programado para executar todas as tarefas do pre-commit para todas as pastas por meio do ambiente virtual do `poetry` e do gerenciador de tarefas `poe` sempre que há uma PR e demais `push`s nela.

Ainda, está habilitado o trigger no evento de comentários dentro da PR, de forma a facilitar a re-execução do workflow sem exigir que um commit seja feito.

A PR de exemplo para verificar a execução deste workflow está [neste link](https://github.com/eddcorts/curso_devops_receitas/pull/2).

#### Exercício 2: Você criou um GitHub Actions que faz deploy quando uma tag é criada na main

O arquivo referente está presente em [`.github/workflows/deploy_tag.yml`](https://github.com/eddcorts/curso_devops_receitas/blob/v1.2/.github/workflows/deploy_tag.yml).

O workflow ativa quando uma tag é criada, havendo uma verificação no job por meio do `event.base_ref` para verificar se a branch em questão é a main.

Ele cria uma imagem e envia para o registro no Docker Hub. Então, ele usa a action da azure para enviar o container para o Web App, que foi previamente criado a partir do painel, havendo as modificações:
- Para habilitar a geração do Publish Profile (para autenticar o deploy): habilitação dos basic auth publishing credentials FTP e SCM 
- Para alterar a porta padrão, visto que o container tem por default a porta 8888 para expor a conexão: variavel de ambiente `WEBSITE_PORT`

(Tutorial de referência: https://learn.microsoft.com/en-us/azure/app-service/deploy-container-github-action?tabs=publish-profile&pivots=github-actions-containers-linux)

#### Exercício 2: - Você criou um Github Actions que pode ser disparado manualmente informando uma tag existente e ele faz deploy do repo nesta tag.

O arquivo referente está presente em [`.github/workflows/deploy_manual.yml`](https://github.com/eddcorts/curso_devops_receitas/blob/v1.2/.github/workflows/deploy_manual.yml).

Inicialmente foi feito com `repository_dispatch`, mas alternado para `workflow_dispatch` visando simplificar a execução (e que não há necessidade no momento de integração de webhook para ativar esse workflow). Como input, ele recebe a string da tag a ser deployada no Web App, havendo a verificação em duas etapas de se a tag em questão existe.

Então, apenas há o deploy da referida tag da imagem.
