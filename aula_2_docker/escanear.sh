PASTA_API=/home/eddcorts/Desktop/lacuna/curso_devops/api_receitas/
IP_SONAR=$(docker inspect sonarqube | grep '"IPAddress":' | head -n 1 | awk -F '"' '{print $4}')

docker run --rm \
    -e SONAR_HOST_URL="http://$IP_SONAR:9000"  \
    -e SONAR_TOKEN="sqp_4db20f486df8eea5c84b3b38b647d7b600bd3154" \
    -v "$PASTA_API:/usr/src" \
    sonarsource/sonar-scanner-cli \
    -Dsonar.projectKey=api_receitas \
    -Dsonar.python.version=3.13