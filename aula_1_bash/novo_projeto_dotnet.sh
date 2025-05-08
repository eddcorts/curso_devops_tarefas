#!/bin/bash

set -e 

nome_projeto=$1

echo Gerando novo projeto ------------------------------------------------------

dotnet new webapi --use-controllers -o $nome_projeto

cd $nome_projeto
mkdir Models

echo Instalando dependências básicas -------------------------------------------
dotnet add package Microsoft.EntityFrameworkCore.InMemory
dotnet add package Microsoft.VisualStudio.Web.CodeGeneration.Design
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet add package Microsoft.EntityFrameworkCore.SqlServer
dotnet add package Microsoft.EntityFrameworkCore.Tools
dotnet add package NSwag.AspNetCore

dotnet tool install -g dotnet-aspnet-codegenerator


# criando script de comandos principais do projeto
echo "#!/bin/bash

comando=\$1

case \$comando in
    help | -h | --help | '?' | '')
        echo 'Gerenciador de comandos
        Comandos:
            - start: compila o projeto e inicia o servidor
            - build: compila o projeto
            - test: executa os testes
            - lint: executa verificação da qualidade de código e formatações
            - help: apresenta esta mensagem de ajuda
        '
        ;;
    start)
        dotnet run
        ;;
    test)
        dotnet test
        ;;
    lint)
        dotnet format $nome_projeto.sln
        ;;
    build)
        dotnet build
        ;;
esac
" > $nome_projeto.sh

chmod +x $nome_projeto.sh


echo ---------------------------------------------------------------------------
echo Projeto instalado com sucesso.
echo 'Para executar tarefas comuns do seu projeto, utilize o comando "./$nome_projeto". Para configurar, basta editar o arquivo também chamado "$nome_projeto".
Utilize "./$nome_projeto help" para conhecer suas funções.'
