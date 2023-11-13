# mentorHub Specifications

The mentorHub platform serves the needs of staff, members, mentors, partners, and donors. The system's primary purpose is to give apprentices real-world experience working in a modern computing environment, and the full design-build-run SDLC for a cloud-native platform.

As the primary purpose of this platform is to provide experience to apprentices, we are taking a SRE-First approach to start by building out a realistic developer experience. We have a head start, and many developer experiences are actually ready to run.

## Stakeholders

We have identified the following people as stakeholders in this system, that is to say these people will be effected by this platform.

- Potential Members
  - Someone interested in ALI
  - Curious novice unsure where to begin
  - Pivoters
  - Person changing careers
  - "Career first" professionals

- Members
  - Apprentice
  - Apprentice Candidate
  - Software Engineers
    - API Engineers
    - Data Engineers
    - Site Reliability Engineers
    - UI/UX Engineers

- Staff
  - Mentors
  - Volunteers
  - CFO
  - CMO

- Partners
  - Allyship focused grooups
  - Businesses that want to share cause
  - Code schools
  - After school clubs

- Potentail Employers
  - Recruiters
  - Small Business owner
  - Startup Founders

- Board Members

- Prospective donors
- Donors

- Open source. contributors

- Client (employee of company paying to use software)

## Personas

For the purpose of documenting Hills statements, we will use the following persona's. These persona's can also act in some cases as a proxy for a RBAC Role.

### Developer Personas

These personas represent software engineers who are designing, building, and running the mentorHub platform.

- Sam the Software Engineer is responsible for the code in one or more repositories, and for approving pull requests in those repositories.

- Tonya the Tester leads end-to-end testing of the code, and manages releases of components into the Testing Environment, and approves the promotion of code into the Staging environment.

- Rhonda the Release Manager is responsible for coordinating the release of new versions of code with the SQA team. They work with Tonya to promote release candidates from the Testing environment into the Staging environment.

- Pam the Product Manager is responsible for coordinating the release of new versions of code between Rhonda and the Marketing team.

### End User Personas

These persona's represent hands-on-keyboard Users of the mentorHub platform.

- Maven the Mentor provides mentorship services to members, and colaborates with other Mentors to imrpove the quality of learning resources.

- Appollo the Apprentice learns new technology by working through an agile cirriculum crafted with their mentor.

- Fran the Financioal Officer does the books, and the taxes, and issues receipts for tax deductable donations.

- Meredith the Marketer conducts marketing campaigns to find new members, mentors, partners, and donors.

## Roadmap of Meaningful Outcomes

### Now (SRE First)

### Next

### Later

Who: Humanity
What: Education Revolution
And then WOW: People are empowered to create value, major progress towards the biggest problems occurs (climate, war, unsafe AI)
Who: Tech Industry
What: Swiss Army Knife Professionals
And then WOW: AI is implemented and integrated in ways never seen before
Who: Mentor
What: Mentorship
And then WOW: Mentee gains confidence and experience
Who: The commons, the public
What: Open and accessible education and career training that has lots of value
And then WOW: Closes talent gap

PR Reviewer approves a pull request, and merges the branch into main and then multi-architectre containers are built and deployed into a cloud hosted Dev environment where initial end-to-end testing occurs.
Testing Lead uses a /test discord bot to specify a domain to be promoted to the test environment and then the selected services are promoted from the Dev environment into the Test environment.
Release Manager uses a /stage discord bot and then all of the services in the Test environment are poromoted to the staging environment.
Product Manager uses a /go-live! discord bot and then all of the services in the Staging environment are poromoted to the production environment.

a scrum master holds regular
an apprentice reads a readme and can set up and tool their environment and onboard to the project async
Software Engineers execute a single bash command and then a local database, with meaningful test data, is available for testing.
Software QA Engineers issue a single bash command and then the solution is available for local testing.
UI/UX Engineers issue a single bash command and then a local API and Backing database are available for testing.
SRE's review a Promethius/Grafana monitoring portal and then they can view performance and throughput metrics for the system.
SRE's deploy a database management container and then schema constraints and migrations are executed when database configuration updates are required.
Data, API, and UI Engineers build and test their code locally before submitting a pull request and then push-storms are reduced and CI expenses are managed.
API software engineers query a Version document from a Collection and then they can make that information observable.
API and UI Engineers run a suite of black-box tests and then they have confirmation of functionality to support publication of code when unit testing is impeeding release.
SRE's open an Admin UI page, or API Endpoint, and then they know what code is running, and how the services are configured to more effectively diagnose incident root cause.
API and UI Engineers save changes as they work and then unit tests run increasing awareness of potential defects introduced by code changes improving developer productivity.

an apprentice clicks a button and is presented a tooling report w/ links to any failing or needed hardware or software issues to address
Members uses a reverse resume tool to set goals for their curriculum
Mentor records resume in the system
Members mark a resource as completed and then the system can track rough duration to complete a resource, improve resource planning durations, and guage individual performance.
Member clicks a link from a learning resource and then the system keeps track of when a member starts learning a topic.
Dream Job Resume on dashboard
Member reviews on-line cirriculum and can quickly see all that they have acomplished, the things they should be working on now, topics that they are probably covering next, and long term goals that they will acieve later.
Mentors and Members achieve goals and get gamification rewards
Member opens dashboard and can easily track progress and or accomplishments
Member signs up on SquareSpace and then their information is added to the institute databases, and welcome abord email is sent that includes instructions on how to schedule introduction meeting, how to get a userID for the system.
Members achieve a level of competency and we issue digital certifications
GitHub Usage stats on search dashboard

Mentor/Mentees get to collaborate in realtime on the best curriculum,
Mentor and Member can co-edit the members cirriculum in real time
Who: Mentors and Mentees
What: Virtual Reality
And then WOW: Remote work and virtual workspaces become a place where people can collaborate more effectively and express themselves more fully

Mentor fills out a become-a-mentor online form and then they are added to the institute databases, and a welcome aboard email is sent that includes instructions on how to schedule introduction meeting, how to get a userID for the system.
Mentor selects a script for an encounter, and then eaisly records notes about the encounter in the members profile.
Mentors assign learning resources to a member, and then the system warns them if they are assigning too much work based on the members historical performance and observed average time to complete a resource.
Mentors collect and learning style and level classification topical resources and then share between themselves

User can use chatbot to help find information in the platform or seek help
Offboarding automation - data security (ForgetMe)

Marketing can use data to create graphs to easily identify and define trends
Marketing does ? - email campaigns, addWords campaigns, others?
Accounts and ledgers provide all needed documentation for tax purposes
staff member uses email list to easily send donor receipts
Accounts and Ledgers provide meaningful metrics to the board
Accountant is able to easily track spending and expenses in an easy and transparent way to share with board
Finance - does ? - end-of-year receipts, taxes, payroll, reporting?
Accounts and Ledgers import and reconcile with bank statements
