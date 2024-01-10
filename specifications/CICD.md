# Infrastructure and CI/CD

## Overview

Repo Structure Standards have a /src/docker folder with the following files:

- /src/docker/docker-build.sh
- /src/docker/Dockerfile

docker-build.sh uses docker build to create a single image targeted to the users architecture. Multi-Architecture images are created and pushed to our GitHub Container Registry by GitHub Actions CI.
These GitHub actions build and push containers with a :latest tag

## CI Notes

We are using the GitHub Docker Container Registry [this article](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry) is helpful in understandign that service.

We are using the [Build and push Docker images](https://github.com/marketplace/actions/build-and-push-docker-images) action, in conjunction with the /src/docker/Dockerfile of each repo.

We use Automatic token authentication to access the registry. See [here](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#using-the-github_token-in-a-workflow) for details.

## Access Checklist

To make sure that the CI GitHub Actions have the proper access to the registry

- Image Package is Linked to the Repository building the image - in Package Settings
- Connect the Repo to the Package page
- Package Access - Make sure repository access is Read-Write or Admin in Package settings
- Repository Settings, Actions, General, Workflow permissions then select Read and Write
