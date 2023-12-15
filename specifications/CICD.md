# Infrastructure and CI/CD

## Overview

Repo Structure Standards have a /src/docker folder with the following files:

- /src/docker/docker-build.sh
- /src/docker/Dockerfile

docker-build.sh uses docker build to create a single image targeted to the users architecture. Multi-Architecture images are created and pushed to our GitHub Container Registry by GitHub Actions CI.
These GitHub actions build and push containers with a :latest tag (see backlog)

## CI Notes

We are using the GitHub Docker Container Registry [this article](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry) is helpful

We are using the [Build and push Docker images](https://github.com/marketplace/actions/build-and-push-docker-images) action, in conjunction with the /src/docker/Dockerfile of each repo.

We use Automatic token authentication to access the registry. See [here](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#using-the-github_token-in-a-workflow) for details.

## Access Checklist

- Image Package is Linked to the Repository building the image - in Package Settings
- Connect the Repo to the Package page
- Package Access - Make sure repository access is Read-Write or Admin in Package settings
- Repository Settings, Actions, General, Workflow permissions then select Read and Write

## Backlog

### Continous Deployment Environments

Create IaC Automation to deploy a Release Management environment (Dev, Test, etc.). Software Deployment to these environments will be acomplished through container tagging. CI will build containers and tag them with a :dev environment tag. Additional CI Automation will pull containers into an environment when they are tagged. Containers can then be promoted between environments by adding new environment tags to the containers.

- [x] Multi-Architecture contianer build and push GitHub Actions
- [ ] Build and test environment provisioning automations
  - [ ] Deploy Dev Environment
  - [ ] Configure CI on tag image
- [ ] Deploy Test Environment
- [ ] Optimize GitHub Actions for Multi-Architecture builds
- [ ] Review Versioning approach, determine if git commit hash the best patch value
  - Requirement - search for code with hash (or alternate value)
  - Should we have CI create a "release" in the repository?
