#!/bin/bash

set -e 

nome_projeto=$1

echo Clonando template ---------------------------------------------------------
git clone git@github.com:Aeternalis-Ingenium/FastAPI-Backend-Template.git $nome_projeto

cd $nome_projeto

# remover as configurações atuais do git de forma a ter um repostiório novo, sem commits, sem origem definida
# readme será mantido para manter instruções a respeito do template
rm -rf .git

# iniciando repositorio limpo
git init .

echo Instalando dependências ---------------------------------------------------
pip list | grep virtualenv || pip install virtualenv

virtualenv venv
source ./venv/bin/activate

cd backend && mkdir coverage

# corrigindo versoes dos pacotes
echo "pydantic==1.*" >> requirements.txt
sed -i "s/SQLAl.*/SQLAlchemy==2\.0\.40/" requirements.txt

pip install -r requirements.txt

pre-commit install

# criando script de comandos principais do projeto
echo "#!/bin/bash

comando=\$1

if [ -z $VIRTUAL_ENV ]; then
    source ../venv/bin/activate
fi

case \$comando in
    help | -h | --help | '?' | '')
        echo 'Gerenciador de comandos
        Comandos:
            - start: inicia o servidor
            - test: executa os testes
            - lint: executa verificação da qualidade de código e formatações
            - help: apresenta esta mensagem de ajuda
        '
        ;;
    start)
        uvicorn src.main:backend_app --reload
        ;;
    test)
        pytest
        ;;
    lint)
        pre-commit run --all-files
        ;;
esac
" > $nome_projeto

chmod +x $nome_projeto



echo ---------------------------------------------------------------------------
echo Projeto instalado com sucesso. Leia o README.md para compreender sua estrutura.
echo Antes de executar o projeto, defina suas variáveis de ambiente. Siga o exemplo em ".env.example".
echo 'Para executar tarefas comuns do seu projeto, utilize o comando "./$nome_projeto". Para configurar, basta editar o arquivo também chamado "$nome_projeto".
Utilize "./$nome_projeto help" para conhecer suas funções.'
