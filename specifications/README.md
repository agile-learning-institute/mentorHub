# institute Design Specifications

The institute platform (new name needed) will help support institute operations. The platform will be built up over time by members, and will start with an SRE First approach, where we build CD to configure infrastructure, CI Pipelines to deploy code, and observable stub level components ready for further enhancements. We are starting by designing the desired developer experience. Through these gates, all future ALI engineers will pass!

## Personas

- Sam the SRE is responsible for....
- U the UI Engineer
- A the API Engineer
- D the Data Engineer
- T the QA Tester

## Meaningful Outcomes 

### Now

- D creates test data for use by other devs
- A creates and unit tests the API locally
- A does local integration tests of the API with test Data
- U creates and unit tests the UI (with mock API)
- U does local integration tests of the UI with API & test Data
- T tests PartnerUI in the Dev environment
- T resets the Dev environment testing data

### Next

- P uses in production
- Add Person domain (polymorphic Member/Mentor/Contact/Donor)
- Add Search domain (polymorphic read-only Partner,Person)
- IAM w/Token based RBAC

### Later

- Cirriculum fragments
- Real-time Concurrency
- Onboarding automation
- Offboarding automation
- GitHub Usage stats on search

## Microservice Bounded Domains

- Partner (a monolithic collection of Partner documents)

Each domain will have

- DataBase repository with test data and schema specifications
- API repository that builds a restful API
- SPA repository that builds a SPA and NgNix service

## Infrastructure

The cloud infrastructure that supports this product will be hosted with AWS, and should all be provisioned and configured by Terraform.

The Pre-Production Infrastructure will consist of a container registry, container runtime, and a secret store.

The Production Environment Infrastructure will consist of a separate container runtime, connected to the same container registry, with it's own secret store, and a MongoDB service.

## Release Management Environments

Release management environments will be acomplished through container tagging. CI will build containers and tag them with a DEV environment tag, and containers will be promoted between environments by adding new environment tags to the containers.

- Dev Environment (CI will deploy here from merge to Main)
- Test Environment (Future, containers promoted from Dev)
- Staging Environment (Future, containers promoted from Test)
- Production Environment (Future, containers promoted from Stage)

## Sprint Planning

- D creates test data for use by other devs
  - create db repo
  - create dockerfile to build mongo container
  - add test data to docker image
  - build and test database container
  - update README

- A creates and unit tests the API locally
  - create api repo
  - build api and unit test
  - update README

- A does local integration tests of the API with test Data
  - run db container
  - test api with test data
  - build and test api in a container
  - update api README

- U creates and unit tests the UI (with mock API)
  - Create the UI repo
  - Create and unit test the UI
  - Create a mock api
  - Integration test the UI with the Mock API
  - Update the README

- U does local integration tests of the UI with API & test Data
  - run db container
  - run api container
  - build and run UI without mock backend
  - build and test UI Container (from NgNix)
  - Update README

- T tests systems in the Dev environment
  - Terraform to provision Dev Environment
    - GitHub Container Repo
    - Secrets Valut for Container Secrets
    - ECR Instance connected to GitHub Container Repo
  - GitHub Actions CI to Build / Push containers
    - DB Container
    - API Container
    - UI (NgNix) Container
  - ECR Configurations to run container with Dev tag

- T resets the Dev environment testing data
  - Automation and GitHub "Button" to kill DB Container in Dev
