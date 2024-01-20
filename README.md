# The mentorHub Platform

mentorHub is a cloud platform that supports our operations, and serves the needs of staff, members, mentors, partners, and donors. This platform is here to give apprentices real-world experience working in a modern cloud computing environment, and exposure to a full design-build-run SDLC with QA controls, and CI/CD Automations. [This is a list of all mentorHub repositories.](https://github.com/orgs/agile-learning-institute/repositories?q=mentorhub&type=all&sort=name)

## Contributing to the platform

### Prerequisites

- Familarize yourself with the [Product Roadmap](./specifications/ROADMAP.md) to understand release plans
- Review the [Architecture Principles](./specifications/PRINCIPLES.md) to understand guiding principles for the architecture
- Review the [Architecture Diagrams](./specifications/ARCHITECTURE.md) to undersand the architecture
- Review the [CI/CD](./specifications/CICD.md) Configurations to understand how code is deployed
- Review [instructions](./docker-configurations/README.md) on how to run the system locally

### Software Engineer Workflow

- Check the [mentorHub Project](https://github.com/orgs/agile-learning-institute/projects/3/views/2) for a Kanban of issues.
- Select an issue that is **On Deck** and move it to **Active** to start your work.
- If you need clarification about the issue, leave a comment on the issue with your question.
- If someone is already assigned to the issue, check with them on how to contribute.
- Assign the issue to yourself.
- Create a branch in the repository, name the branch with a -issueNN suffix
- Create a draft PR to ask for reviews or guidance
- After you have fully tested your changes, change the PR from draft to open and ask for reviews.
- Once your changes have been merged back into the main branch the code is deployed to Dev.
- At this time you should be able to conduct preliminary end to end testing.
- When you are satisfied that the work is ready for integration testing, move the issue from **Active** to **Done**

### Software Quality Workflow

- Check the [mentorHub Project](https://github.com/orgs/agile-learning-institute/projects/3/views/2) for a Kanban of issues.
- Select an issue that is in **Done** and move it to **Testing** to start your work.
- Do your Cypress/Postman tests in the Testing Environment
- Open new issues for any defects found
- When testing is complete, if there are still outstanding defects, move the issue from **Testing** to **Active**
- When testing is complete and all known issues have been resolved, move the issue from **Testing** to **Complete**
- NOTE: This workflow needs some work - TBD by SQA

### What if I have a new idea

- Create an issue for your idea, include details and add it to the project.
- Ask for review of the issue.
- Once the issue is approved it will be placed either in the **Backlog** or the **On Deck** list.

## Before Creating new repositories

It is very unlikely that you will need to create a new repository, but if you should be lucky enough to start something from scratch, all mentorHub repositories should be created in the agile-learning-institute organization, follow mentorhub naming standards outlined below, be *public*, allow the *mentorHub* team to have *maintainer* access, and use one of the following templates:

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
