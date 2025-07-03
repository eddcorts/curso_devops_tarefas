`kubectl <get/delete/describe> <node/pod/etc> <nome>`

`kubectl apply -f <arquivo.yaml>`

---

cluster: conjunto de nodes

node: maquinas

pod: equivalente ao serviço do compose

---

**service**: cria uma interface de rede pros pods; nem os proprios containers consiguem se interagir sem um service

> para liberar portas no localhost
> 
> `kubectl port-forward <pod> <porta:porta>`

**replicaset**: gerencia réplicas de pods, geralmente gerenciado por um deployment

**statefulset**: equivalente ao replicaset, contudo com gerenciamento de persistencia de dados e mantendo IPs fixos etc de forma a prezar por estabilidade

**deployment**: gerenciamento de replicaset e pod

---

daemon set: rodar 1 instancia por nó
jobs: executa um job 1 vez
cron jobs: executa um job agendadamente

---

tarefa:

- criar um stateful set pro banco de dados da api com pelo menos 2 replicas: resultado em statefulset-postgres.yaml
