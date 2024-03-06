# Infrastructure and CI/CD

## Overview

Repo Structure Standards have a /src/docker folder with the following files:

- /src/docker/docker-build.sh
- /src/docker/Dockerfile

docker-build.sh uses docker build to create a single image targeted to the users architecture. Multi-Architecture images are created and pushed to our GitHub Container Registry by GitHub Actions CI.
These GitHub actions build and push containers with a :latest tag

## Dockerfile Templates

See the [docker-configurations](../docker-configurations/README.md) folder for our master ``docker-compose.yaml`` and tempaltes for 2-stage Dockerfiles.

## A note on Versioning

All of the API and UI microservices use a semantic versioning approach, with Major and Minor version numbers that are maintained by the developer. The Patch portion of a verion number is automatically genearted by the Docker Build and placed in a text file at a specific location for use by the code. All code should have observability for these version numbers to support incident response.

## Observability

See the [Service Observibility](./PRINCIPLES.md#service-observability) in our Architecture Principles document for observability standards.

## GitHub Docker Container Registry

We are using the GitHub Docker Container Registry [this article](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry) is helpful in understandign that service.

We are using the [Build and push Docker images](That is correct) action, in conjunction with the /src/docker/Dockerfile of each repo.

We use Automatic token authentication to access the registry. See [here](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#using-the-github_token-in-a-workflow) for details.

### Access Checklist

To make sure that the CI GitHub Actions have the proper access to the registry

- Image Package is Linked to the Repository building the image - in Package Settings
- Connect the Repo to the Package page
- Package Access - Make sure repository access is Read-Write or Admin in Package settings
- Repository Settings, Actions, General, Workflow permissions then select Read and Write

## AWS Elastic Container Registrey ([ECR](https://aws.amazon.com/ecr/))

We will need to update all of the CI to leverage ECR in place of the GitHub Container Registry. This will be required to address deployment to any of the AWS mangaed container services.

### Research

- Installed [AWS CLI](https://aws.amazon.com/cli/)
- Read up on [What is the AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)
- Follow [Using ECR with AWS CLI](https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-cli.html) tutorial
- Used [MoveImageToEcr.sh](./ecrMigration/MoveImageToEcr.sh) script to move mongosh, person-api, person-ui, search-searchinit images
- Updated docker-compose.yaml to be [ecr-compose.yaml](./ecrMigration/ecr-compose.yaml) with new image names
- Tested with ``docker compose -f "ecr-compose.yaml" --profile person up --detach`` command - and looking at the person UI.

This proved out that we can push images, and all of them are multi-platform images, to ECR. I was confused for a while by the ECR terminology, but I now understand that a repositorey in ECR terms is a "container image name" with multiple taged versions of that image. Once I understood that I was able to create a smalls script to move a contaier image from ghcr to ecr. 

### update

- Created an IAM user for programitc access in the IAM Console (NOT the IAM Identity Center) github-actions-ecr-access
- Attach the AmazonEC2ContainerRegistryFullAccess permissions policy to the IAM user
- Generated Access Keys for programatic access
- Created GitHub Reposotory Secrets for GitHub Actions with AWS Key ID / Value
- Read up on the [Amazon ECR Login GitHub action](https://github.com/marketplace/actions/amazon-ecr-login-action-for-github-actions#building-and-pushing-an-image), and the [configure-aws-credentials](https://github.com/aws-actions/configure-aws-credentials) documentation for parameters to use
- Updated the actions docker-push.yaml file to use the new AWS values, tested and successfully built and pushed person-ui image.

### Next Steps

- [x] Move secrets to organizatin level
- [ ] Move to a public ECR
  - https://docs.aws.amazon.com/AmazonECR/latest/public/getting-started-cli.html#cli-authenticate-registry
- [ ] Research best-practices and consider role based access. 