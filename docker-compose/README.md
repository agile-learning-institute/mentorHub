# Running Services locally

The Institute Platform is made up of a collection of microservices, and you can use the commands outlined in this document to run different parts of the solution locally.

## Overview

All of the [run container commands](#commands) can be used to run different combinations of services. A ~/local folder is used to fetch a docker-compose.yaml file, and executing a ```docker-compose up --detach``` command. A few seconds after executing that command you should see something similar to

```bash
 ✔ Network local_default                   Created
 ✔ Container local-institute-mongodb-1     Healthy
 ✔ Container local-institute-mongosh-1     Exited
 ✔ Container local-institute-person-api-1  Started
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

## Commands

### Run the person triplet

```bash
curl https://raw.githubusercontent.com/agile-learning-institute/institute/main/docker-compose/run-local-person.sh | /bin/bash
```

You can now use the [Access paths](https://github.com/agile-learning-institute/institute-person-ui#access-paths) documented in the [institute-persion-ui](https://github.com/agile-learning-institute/institute-person-ui) repository.

### Run the person api and backing database

```bash
curl https://raw.githubusercontent.com/agile-learning-institute/institute/main/docker-compose/run-local-person-api.sh | /bin/bash
```

You can now use the [Curl Commands](https://github.com/agile-learning-institute/institute-person-api#local-api-testing-with-curl) documented in the [institute-persion-api](https://github.com/agile-learning-institute/institute-person-api) repository.

### Run the mongoDB backing database

```bash
curl https://raw.githubusercontent.com/agile-learning-institute/institute/main/docker-compose/run-local-db.sh | /bin/bash
```

You can now use the [Mongo Compass](https://github.com/agile-learning-institute/institute-mongodb#optionally) documented in the [institute-mongodb](https://github.com/agile-learning-institute/institute-mongodb) repository.
