# The Institute Platform

The Institute Platform is made up of a collection of microservices, and supports the operations of the institute. These services are designed, built, and run by our members to support our operations. See [here](https://github.com/orgs/agile-learning-institute/repositories?q=institute&type=all&sort=name) for a list of active repositories.

## Design Specifications

See [here](./specifications/README.md) for the Institute Platform Design specifications

## Team

- architect: Mike Storey
- lead-engineer: Karmen Durbin
- ui-engineer: TBD
- api-engineer: TBD
- data-engineer: TBD
- reliability-engineer: TBD

## Trello Board

TODO: - Get instructions from Karmen, decide how we will do sprints. How can someone volunteer to work on a sprint?

## Before Contributing

Since GitHub does not have the concepts of folders to organize repositories, we are using a naming convention to make it easy to find related code. All institute repositories should be created in the agile-learning-institute organization. The repositories should follow this convention ```institute-[service]-[element]``` where service is a service boundry name such as profile, partner, search, etc. and element is one of ```ui | api```. for example ```institute-profile-ui``` would contain a Single Page WebApp, that uses the ```institute-profile-api``` api. All of the mongo data structures and test data can be found in [```institute-mongodb```](https://github.com/agile-learning-institute/institute-mongodb). Also note that these names are technology agnostic, but the code deployed within a project should be a specific implementation. i.e. institute-search-api could be in any language, but should be implemented in only one.
