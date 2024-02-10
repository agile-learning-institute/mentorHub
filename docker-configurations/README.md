# Running Services locally

The Institute Platform is made up of a collection of microservices, and you can use the commands outlined in this document to run different parts of the solution locally.

## Overview

All of the [run container commands](#run-commands) can be used to run different combinations of services. Each of them will download a bash script that creates a ~/local folder, fetches a docker-compose.yaml file, and then executes the ```docker-compose up --detach``` command. Ten to twenty seconds after executing that command you should see something similar to the following

```bash
 ✔ Network local_default                   Created
 ✔ Container local-mentorhub-mongodb-1     Healthy
 ✔ Container local-mentorhub-mongosh-1     Exited
 ✔ Container local-mentorhub-person-api-1  Started
 ✔ Container local-mentorhub-person-ui-1   Started
 ```

Once the containers are running, you can use `docker compose` commands to stop and start them. This Dockerfile contains different targets, called profiles, which must be specified to choose the services to run. Profile can be one of `db`, `person`, or `person-api`.

The `--profile` command-line option or `COMPOSE_PROFILES` environment variable can be used to specify which profile to run. For this example, we will use the `db` profile.

### Restart containers without losing data

```bash
cd ~/local
docker compose --profile db stop
docker compose --profile db start
```

### Restart containers and Reset test data

```bash
cd ~/local
docker compose --profile db down
docker compose --profile db up --detach
```

### Pull the latest containers from the registry

```bash
cd ~/local
docker compose --profile db down
docker image prune -f
docker volume prune -f
docker image pull ghcr.io/agile-learning-institute/mentorhub-mongosh:latest
docker image pull ghcr.io/agile-learning-institute/mentorhub-person-api:latest
docker image pull ghcr.io/agile-learning-institute/mentorhub-person-ui:latest
```

## Run Commands

### Run the person triplet

```bash
/bin/bash <(curl -o - https://raw.githubusercontent.com/agile-learning-institute/mentorhub/main/docker-configurations/run-local.sh) person
```

You can now use the [Access paths](https://github.com/agile-learning-institute/mentorhub-person-ui#access-paths) documented in the [mentorhub-person-ui](https://github.com/agile-learning-institute/mentorhub-person-ui) repository.

### Run the person api and backing database

```bash
/bin/bash <(curl -o - https://raw.githubusercontent.com/agile-learning-institute/mentorhub/main/docker-configurations/run-local.sh) person-api
```

You can now use the [Curl Commands](https://github.com/agile-learning-institute/mentorhub-person-api#local-api-testing-with-curl) documented in the [mentorhub-person-api](https://github.com/agile-learning-institute/mentorhub-person-api) repository.

### Run the MongoDB backing database

```bash
/bin/bash <(curl -o - https://raw.githubusercontent.com/agile-learning-institute/mentorhub/main/docker-configurations/run-local.sh) db
```

You can now use [Mongo Compass](https://github.com/agile-learning-institute/mentorhub-mongodb#optionally) as documented in the [mentorhub-mongodb](https://github.com/agile-learning-institute/mentorhub-mongodb) repository.

### Troubleshooting

#### Error Encountered While Running Container Commands on WSL (Ubuntu 20.04)

If you encounter an error similar to `curl: option --output-dir: is unknown`, this is because the `--output-dir` flag is only available from `curl 7.73.0` and the most recent and secure version for `Ubuntu 20.04` is `curl 7.68.0`. To bypass this, you can manually create the local folder, fetch the docker-compose.yaml file and setup the contaners by running the following commands:

##### Person Triplet

```bash
mkdir ~/local && cd ~/local && curl --create-dirs --output docker-compose.yaml https://raw.githubusercontent.com/agile-learning-institute/mentorhub/main/docker-configurations/docker-compose.yaml && docker compose --profile person up --detach
```

##### Person API and Backing Database

```bash
mkdir ~/local && cd ~/local && curl --create-dirs --output docker-compose.yaml https://raw.githubusercontent.com/agile-learning-institute/mentorhub/main/docker-configurations/docker-compose.yaml && docker compose --profile person-api up --detach
```

##### MongoDB Backing Database

```bash
mkdir ~/local && cd ~/local && curl --create-dirs --output docker-compose.yaml https://raw.githubusercontent.com/agile-learning-institute/mentorhub/main/docker-configurations/docker-compose.yaml && docker compose --profile db up --detach
```

After running this command, you'll be in the local directory but you should see a message similar to the one in [the overview](#overview)
