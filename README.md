# Instruções Docker

Precisa limpar tudo do seu docker?

```bash
docker system prune -a --volumes -f
```

Colocando em modo desenvolvimento

Considerando que é necessário rodar com o seu usuário, rode

```bash
id -u
```

E altere no arquivo Dockerfile.development com o valor que encontrou

Então a build você só precisa executar a primeira vez:

```bash
docker compose -f docker-compose.development.yml build
```

E para subir a aplicação rode:

```bash
docker compose -f docker-compose.development.yml up
```

Para rodar migrations, testes... etc, rode o serviço app com o que for necessário:

```bash
docker compose -f docker-compose.development.yml run app rails db:drop db:create db:migrate
```

Exemplo de interação entre computador e container:

```bash
docker compose -f docker-compose.development.yml run app rails d model comment
docker compose -f docker-compose.development.yml run app rails g model comment post:references comment:text
docker compose -f docker-compose.development.yml run app rails c
```

Para testes por exemplo execute `guard`:

```bash
docker compose -f docker-compose.development.yml run app bundle exec guard
```

Para migrations (lembrando que talvez precise rodar tanto em development quanto para test):

```bash
docker compose -f docker-compose.development.yml run app rails db:migrate
```

Caso queira parar com os serviços:

```bash
docker compose -f docker-compose.development.yml down
```

```
Ruby on Rails com Docker e docker-compose em modo desenvolvimento


Normalmente existem perguntas e detalhes sobre como desenvolver usando docker e docker-compose em modo desenvolvimento: a eu preciso buildar, a eu preciso subir e descer as coisas o tempo todo... Calma vamos lá
```