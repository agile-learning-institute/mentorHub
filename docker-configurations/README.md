# Running Services locally

The Institute Platform is made up of a collection of microservices, and you can use the commands outlined in this document to run different parts of the solution locally.

## Overview

All of the [run container commands](#run-commands) can be used to run different combinations of services. Each of them will download a bash script that creates a ~/local folder, fetchs a docker-compose.yaml file, and then executes the ```docker-compose up --detach``` command. Ten to twenty seconds after executing that command you should see something similar to the following

```bash
 ✔ Network local_default                   Created
 ✔ Container local-mentorhub-mongodb-1     Healthy
 ✔ Container local-mentorhub-mongosh-1     Exited
 ✔ Container local-mentorhub-person-api-1  Started
 ✔ Container local-mentorhub-person-ui-1   Started
 ```

Once the containers are running, you can use the follwing commands to stop and start them:

### Restart containers without loosing data

```bash
cd ~/local
docker compose stop
docker compose start
```

### Restart containers and Reset test data

```bash
cd ~/local
docker compose down
docker compose up --detach
```

### Pull the latest containers from the registry

```bash
cd ~/local
docker compose down
docker image prune -f
docker volume prune -f
docker image pull ghcr.io/agile-learning-institute/mentorhub-mongosh:latest
docker image pull ghcr.io/agile-learning-institute/mentorhub-person-api:latest
docker image pull ghcr.io/agile-learning-institute/mentorhub-person-ui:latest
```

## Run Commands

### Run the person triplet

```bash
/bin/bash <(curl https://raw.githubusercontent.com/agile-learning-institute/mentorhub/main/docker-configurations/run-local.sh) person
```

You can now use the [Access paths](https://github.com/agile-learning-institute/mentorhub-person-ui#access-paths) documented in the [mentorhub-persion-ui](https://github.com/agile-learning-institute/mentorhub-person-ui) repository.

### Run the person api and backing database

```bash
/bin/bash <(curl https://raw.githubusercontent.com/agile-learning-institute/mentorhub/main/docker-configurations/run-local-person.sh) person-api
```

You can now use the [Curl Commands](https://github.com/agile-learning-institute/mentorhub-person-api#local-api-testing-with-curl) documented in the [mentorhub-persion-api](https://github.com/agile-learning-institute/mentorhub-person-api) repository.

### Run the mongoDB backing database

```bash
/bin/bash <(curl https://raw.githubusercontent.com/agile-learning-institute/mentorhub/main/docker-configurations/run-local.sh)
```

You can now use [Mongo Compass](https://github.com/agile-learning-institute/mentorhub-mongodb#optionally) as documented in the [mentorhub-mongodb](https://github.com/agile-learning-institute/mentorhub-mongodb) repository.
