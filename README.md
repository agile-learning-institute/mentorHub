# The mentorHub Platform

mentorHub is a cloud platform that supports our operations, and serves the needs of members, mentors, partners, and donors. This platform is here to give apprentices real-world experience working in a modern computing environment, and exposure to a full design-build-run SDLC with QA controls, and CI/CD Automations.

mentorHub is comprised of a collection of microservices that fall along bounded domains. See [here](https://github.com/orgs/agile-learning-institute/repositories?q=mentorhub&type=all&sort=name) for a list of repositories.

## Running Locally

Instructions on how to [run components locally](./docker-configurations/README.md)

## Design Specifications

Feature Roadmap can be found in the [Design specifications](./specifications/ROADMAP.md)

## CI/CD Information

Information on [CI/CD Automation](./specifications/CICD.md)

## Before Contributing

All mentorHub repositories should be created in the agile-learning-institute organization, follow mentorhub naming standards, be public, and use one of the following templates:

- [x] [template-vanilla](https://github.com/agile-learning-institute/template-vanilla) a minimal repository with no language specific code.
- [ ] [template-api-go-gorilla-mongodb](https://github.com/agile-learning-institute/template-api-go-gorilla-mongodb) - Golang / Mongo API
- [ ] [template-api-ts-express-monbodb](https://github.com/agile-learning-institute/template-api-ts-express-monbodb) - Typescript / Mongo API
- [ ] [template-api-py-flask-mongodb](https://github.com/agile-learning-institute/) - Python / Mongo API
- [ ] [template-ui-vue-vuetify-axios](https://github.com/agile-learning-institute/) - Vuejs SPA
- [ ] [template-ui-react-?-axios](https://github.com/agile-learning-institute/) - React SPA
- [ ] [template-ui-angular-?-?](https://github.com/agile-learning-institute/) - Angular SPA
- [ ] [template-mongodb](https://github.com/agile-learning-institute/) - MongoDB schema versioning template
- [ ] [template-sqldb](https://github.com/agile-learning-institute/) - SQL schema versioning template

NOTE: If your desired template is not available (not checked off) then you can use the vanilla template, and you should consider creating a new template after you get your code to a functional state.

All mentorHub repositories should follow this naming convention ```mentorhub-[service]-[element]``` where service is a service boundary name such as profile, partner, search, subject, etc. and element is one of ```ui | api```. for example ```mentorhub-profile-ui``` would contain a Single Page Web App, that uses the ```mentorhub-profile-api``` api. All of the mongo data structures and test data can be found in [```mentorhub-mongodb```](https://github.com/agile-learning-institute/mentorhub-mongodb). Also note that these names are technology agnostic, but the code deployed within a project should be a specific implementation. i.e. mentorhub-search-api could be in any language, but should be implemented in only one.
