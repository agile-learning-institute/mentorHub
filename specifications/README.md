# institute Design Specifications

The institute platform (new name needed) will help support institute operations. The platform will be built up over time by members, and will start with an SRE First approach, where we build CD to configure infrastructure, and CI Pipelines to deploy code, and a few observable stub level components ready for further enhancements. We are starting by designing the desired developer experience. Through these gates, all future ALI engineers will pass!

## Stakeholders

We have identified the following people as stakeholders in this system, that is to say these people will be effected by this platform.

- Members
  - Apprentice Candidate
  - Apprentice
  - Software Engineers
    - Data Engineers
    - API Engineers
    - UI/UX Engineers
    - Site Reliability Engineers
- Staff
  - Marketing
  - CFO
  - Mentors
- Donors
- Partners
- Board Members
- Employers

## Personas

- Sam the SRE is responsible for the performance and availability of the solution. They focus on creating a developer experience that helps the team proactively manage system availability.

- Uli the the UI Engineer designs and builds Single Page Web-apps. They are focused on building user experiences, and rely on services from a custom API.

- Andy the API Engineer designs and builds custom restful API's to support the user experience. They rely on backing services provided by the Data Engineer.

- Dawn the Data Engineer is responsible for data integrity, database performance, and data schema management.

- Tamy the QA Tester is responsible for ensuring that new code is functioning as designed before it is released into a prodcution environment.

- Mike the Mentor

- F the Financioal Officer

- Marketer

## Meaningful Outcomes

### Now (SRE First)

### Next

### Later

- ?Who? approves a pull request, and merges the branch into main and then multi-architectre containers are built and deployed into a cloud hosted Dev environment where initial end-to-end testing occurs.
- ?Who? selects a domain, clicks a promote to Test button and then the selected services are promoted from the Dev environment into the Test environment.
- ?Who? clicks a promote to Staging button and then all of the services in the Test environment are poromoted to the staging environment.
- ?Who? clicks a Go-Live! button and then all of the services in the Staging environment are poromoted to the production environment.
- Software Engineers execute a single bash command and then a local database, with meaningful test data, is available for testing.
- UI/UX Engineers issue a single bash command and then a local API and Backing database are available for testing.
- Software QA Engineers issue a single bash command and then the solution is available for local testing.
- API software engineers query a Version document from a Collection and then they can make that information observable.
- SRE's deploy a database management container and then schema constraints and migrations are executed when database configuration updates are required.
- Data, API, and UI Engineers build and test their code locally before submitting a pull request and then push-storms are reduced and CI expenses are managed.
- SRE's open an Admin UI page, or API Endpoint, and then they know what code is running, and how the services are configured to more effectively diagnose incident root cause.
- SRE's review a Promethius/Grafana monitoring portal and then they can view performance and throughput metrics for the system.
- API and UI Engineers save changes as they work and then unit tests run increasing awareness of potential defects introduced by code changes improving developer productivity.
- API and UI Engineers run a suite of black-box tests and then they have confirmation of functionality to support publication of code when unit testing is impeeding release.
- Mentor selects a script for an encounter, and then eaisly records notes about the encounter in the members profile.
- Finance - does ? - end-of-year receipts, taxes, payroll, reporting?
- Marketing does ? - email campaigns, addWords campaigns, others?
- Mentors collect topical resources and then share between themselves
- Mentors assign learning resources to a member, and then the system warns them if they are assigning too much work based on the members historical performance and observed average time to complete a resource.
- Member reviews on-line cirriculum and can quickly see all that they have acomplished, the things they should be working on now, topics that they are probably covering next, and long term goals that they will acieve later.
- Member clicks a link from a learning resource and then the system keeps track of when a member starts learning a topic.
- Members mark a resource as completed and then the system can track rough duration to complete a resource, improve resource planning durations, and guage individual performance.
- Mentor and  Member can co-edit the members cirriculum in real time
- Member signs up on SquareSpace and then their information is added to the institute databases, and welcome abord email is created and sent that includes instructions on how to schedule introduction meeting, how to get a userID for the system.
- Mentor fills out a become-a-mentor online form and then they are added to the institute databases, and a welcome aboard email is created.
- Members achieve a level of competency and we issue digital certifications
- Offboarding automation - data security (ForgetMe)
- GitHub Usage stats on search dashboard
- Accounts and Ledgers import and reconcile with bank statements
- Accounts and ledgers provide all needed documentation for tax purposes
- Accounts and Ledgers provide meaningful metrics to the board

## Microservice Bounded Domains

- Identity?
- Person
- Partner
- Topics & Resources
- Cirriculum
- Search

## Infrastructure

The cloud infrastructure that supports this product will be hosted with AWS, and is all provisioned and configured by Terraform.

## Continous Integration Automations

GitHub Actions build and push containers to GitHub Container Registry with :dev tag
?EKS?ECS? pulls containers into the Dev enviornment when a new images is tagged :dev

## Continous Deployment Environments

Release management environments will be acomplished through container tagging. CI will build containers and tag them with a :dev environment tag, and containers will be promoted between environments by adding new environment tags to the containers.

- Dev Environment (CI will deploy individual service here)
- Test Environment (Services in a domain promoted from Dev)
- Staging Environment (Full System promoted from Test)
- Production Environment (Full System promoted from Staging)
