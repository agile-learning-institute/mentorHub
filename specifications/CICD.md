# Infrastructure and CI/CD

## Overview

### Shared Code - Reusable Modules
You should be aware of these:
- [mentorhub-utils](https://github.com/agile-learning-institute/mentorHub-utils) Python API Utilities (Config, Flask, Mongo)
- [mentorHub-ts-api-utils](https://github.com/agile-learning-institute/mentorHub-ts-api-utils) Typescript API Utilities (Config, Express, Mongo)
- [mentorhub-ts-vue-utils](https://github.com/agile-learning-institute/mentorHub-ts-vue-utils) Vue.js Utilities shared components
- [Mongo Schema Manager](https://github.com/agile-learning-institute/mongoSchemaManager) is a Configuration as Code utility that deploys MongoDB Schema validation rules, and optionally loads test data. This utility is used by the
[mentorHub-mongodb](https://github.com/agile-learning-institute/mentorHub-mongodb) repo to implement our initialize-mongodb service. 

### Templates
- [template-python-flask-api](https://github.com/agile-learning-institute/template-python-flask-api)
- [template-ts-express-api](https://github.com/agile-learning-institute/template-ts-express-api)
- [template-ts-vue-ui](https://github.com/agile-learning-institute/template-ts-vue-ui)

### Repo's of special note
- [mentorhub](https://github.com/agile-learning-institute/mentorHub) - THIS repo is critical, the [mh utility](./../mentorHub-developer-edition/README.md) and especially the [docker-compose.yaml](../docker-configurations/docker-compose.yaml) that under-pins the mh utility.
- [mentorhub-mongodb](https://github.com/agile-learning-institute/mentorHub-mongodb) builds the container that implements our initialize-mongodb service which configures schema validation and loads test data.
- [mentorhub-elasticsearch](https://github.com/agile-learning-institute/mentorHub-elasticsearch) builds the container that implements our initialize-elasticsearch service which configures the search-index, and loads test data from the mongodb database. This service can be run on demand to refresh search index data. 
- [mentorhub-kafka-connect](https://github.com/agile-learning-institute/mentorHub-kafka-connect) builds a customized confluent-kafka-connect container with our MongoDB -> Elasticsearch CDC pipeline that provides real-time updates to the elasticsearch database. 

## Repo Structure Standards 
- Each repo uses it's native dependency management tool (npm, pipenv, maven, etc.) to support automatons like container creation and testing. For projects without a dependency tool the ``make`` utility is utilized. When it makes sense these scripts should be supported
  - clean - Cleanup any build noise
  - build - build deployable code
  - start - start backing containers, run local
  - local - build and run code locally
  - test - run unit testing
  - stepci - run stepci black box texting (APIs)
  - container - build and run the container
- Where practical, Dockerfiles will use the above scripts to build and publish code. 
- The Dockerfile should be at the root of the repo, sample Dockerfiles can be found in the [docker-configurations](../docker-configurations/) folder. 
- Multi-Architecture images (AMD and ARM) are created and pushed to our GitHub Container Registry by GitHub Actions CI.
- The GitHub actions build and push containers with a :latest tag

## Dockerfile Templates

See the [docker-configurations](../docker-configurations/README.md) folder for our master ``docker-compose.yaml`` and templates for 2-stage Dockerfiles.

## Observability

See the [Service Observability](./PRINCIPLES.md#service-observability) in our Architecture Principles document for observability standards. See the ``Config`` object in [mentorhub-utils](https://github.com/agile-learning-institute/mentorHub-utils) *python* or [mentorhub-ts-api-utils](https://github.com/agile-learning-institute/mentorHub-ts-api-utils) *typescript* for the definitive list of configuration values. Note that a single volume with all configuration values can be mounted to all API containers to ensure configuration synchronization. 

## GitHub Docker Container Registry

We are using the GitHub Docker Container Registry [this article](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry) is helpful in understanding that service.

We are using the [Build and push Docker images](https://github.com/marketplace/actions/build-and-push-docker-images) action, in conjunction with the /Dockerfile of each repo.

We use Automatic token authentication to access the registry. See [here](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#using-the-github_token-in-a-workflow) for details.

### Access Checklist

To make sure that the CI GitHub Actions have the proper access to the registry. Note that you must first manually push the docker images to the github registry before you can configure access. See the linked articles above for information about how to authenticated to the github docker registry. After the initial image has been published:
- [ ] Make sure the image is Public
- [ ] Image Package is Linked to the Repository building the image in Package Settings
- [ ] Connect the Repo to the Package page
- [ ] Package Access - Make sure repository access is Read-Write or Admin in Package settings
- [ ] Repository Settings, Actions, General, Workflow permissions then select Read and Write

## AWS Elastic Container Registry ([ECR](https://aws.amazon.com/ecr/))

We will need to update all of the CI to leverage ECR in place of the GitHub Container Registry. This will be required to address deployment to any of the AWS managed container services.

### Research

- Installed [AWS CLI](https://aws.amazon.com/cli/)
- Read up on [What is the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)
- Follow [Using ECR with AWS CLI](https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-cli.html) tutorial
- Used [MoveImageToEcr.sh](./ecrMigration/MoveImageToEcr.sh) script to move mongosh, person-api, person-ui, search-searchinit images
- Updated docker-compose.yaml to be [ecr-compose.yaml](./ecrMigration/ecr-compose.yaml) with new image names
- Tested with ``docker compose -f "ecr-compose.yaml" --profile person up --detach`` command - and looking at the person UI.

This proved out that we can push images, and all of them are multi-platform images, to ECR. I was confused for a while by the ECR terminology, but I now understand that a repository in ECR terms is a "container image name" with multiple tagged versions of that image. Once I understood that I was able to create a smalls script to move a container image from ghcr to ecr. 

### update

- Created an IAM user for programmatic access in the IAM Console (NOT the IAM Identity Center) github-actions-ecr-access
- Attach the AmazonEC2ContainerRegistryFullAccess permissions policy to the IAM user
- Generated Access Keys for programmatic access
- Created GitHub Repository Secrets for GitHub Actions with AWS Key ID / Value
- Read up on the [Amazon ECR Login GitHub action](https://github.com/marketplace/actions/amazon-ecr-login-action-for-github-actions#building-and-pushing-an-image), and the [configure-aws-credentials](https://github.com/aws-actions/configure-aws-credentials) documentation for parameters to use
- Updated the actions docker-push.yaml file to use the new AWS values, tested and successfully built and pushed person-ui image.

### another update

- tied in knots about configuring permission sets, roles, groups, etc. I think I have it down
- Added AmazonElasticContainerRegistryPublicFullAccess policy to the System Administrator permission set

### Next Steps

- [x] Move secrets to organization level
- [ ] Move to a public ECR
  - https://docs.aws.amazon.com/AmazonECR/latest/public/getting-started-cli.html#cli-authenticate-registry
- [ ] Research best-practices and consider role based access. 

###