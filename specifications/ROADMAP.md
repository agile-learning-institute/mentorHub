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

- Sam the Software Engineer is responsible for the code in one or more repositories.

- Sree the Site Reliability Enginner is resposible for infrastructure and ensuring that the system is always up and available.

- Tonya the Tester is responsible for Software Quality Assurance, and leads end-to-end testing of the code.

- Rhonda the Release Manager is responsible for coordinating the release of new versions of code.

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

#### These are Marketing, or possibly Analytics hills

- Humanity, does Education Revolution and then People are empowered to create value, major progress towards the biggest problems occurs (climate, war, unsafe AI)

- Tech Industry, does Swiss Army Knife Professionals, and then AI is implemented and integrated in ways never seen before.

- Mentor, does Mentorship and then Mentee gains confidence and experience

- The commons, the public, have access to Open and accessible education and career training that has lots of value and then closes talent gap

#### SRE First Outcomes

- a scrum master does ??? and then the team bulids software

- Sam the Software Engineer reads a repo readme and can eaisly set up their local development environment, develop and locally test their code with local backing services.

- Sam the Software Engineer approves a pull request, and merges a feature branch into main and then multi-architectre containers are built and deployed into a cloud hosted Dev environment where initial end-to-end testing occurs.

- Tonya the Tester issues a single bash command and then the solution is available for local testing.

- Sree the SRE runs a runbook script and then services from one environment are promtoted into another.

- Sree the SRE deploies a database management container and then schema constraints and migrations are executed when database configuration updates are required.

- Sree the SRE opens an admin view in a SPA and then they can review Versions of different components of the system, configuration values, and other information helpful during incident response.

- Sree the SRE reviews a Promethius/Grafana monitoring portal including health information from system API's, and then they can view performance and throughput metrics to support incident response.

#### SRE Later

- *Sam the Software Engineer creates black-box testing for thier components and then they can be more confident in the performance of their code, and they can provide a starting place for the SQA team to build automated end-to-end testing.

- *Tonya the Tester uses a /test discord bot to specify a domain to be promoted to the test environment and then the selected services are promoted from the Dev environment into the Test environment.

- *Rhonda the Release Manager uses a /stage discord bot and then all of the services in the Test environment are poromoted to the staging environment.

#### End User Outcomes

- Any user confirms that they want their data removed and then their account is deleted and any PII related to their identity is removed from the system in compliance with the EU General Data Protection Regulations (GDPR).

- Automated Onboarding
  - Member signs up on SquareSpace and then their information is added to the mentorHub databases, and welcome abord email is sent that includes instructions on how to schedule introduction meeting, how to get a userID for the system.

  - Mentor fills out a become-a-mentor online form and then they are added to the mentorHub databases, and a welcome aboard email is sent that includes instructions on how to schedule introduction meeting, how to get a userID for the system.

- Apollo the Apprentice clicks a button and is presented a tooling report w/ links to any failing or needed hardware or software issues to address.

- Members achieve a level of competency and we issue digital certifications
GitHub Usage stats on search dashboard

This is the big one - there is a single great hill in here somewhere, probably Slice of Function (birthday cake).

- Members uses a reverse resume tool to set goals for their curriculum
  - Mentor records resume in the system
  - Dream Job Resume on dashboard
  - Member opens dashboard and can easily track progress and or accomplishments

This section is about the Mentor/Apprentice Encounter and Cirriculum, above concept will impact these

- Mentor selects a script for an encounter, and then eaisly records notes about the encounter in the members profile and the system can analyise the data to suggest improvements.

- Member reviews on-line cirriculum and can quickly see all that they have acomplished, the things they should be working on now, topics that they are probably covering next, and long term goals that they will acieve later.

- Mentor/Mentees get to collaborate in realtime on the best curriculum
  - Mentor and Member can co-edit the members cirriculum in real time
- Mentors assign learning resources to a member, and then the system warns them if they are assigning too much work based on the members historical performance and observed average time to complete a resource.
- Member clicks a link from a learning resource and then the system keeps track of when a member starts learning a topic.
- Members mark a resource as completed and then the system can track rough duration to complete a resource, improve resource planning durations, and guage individual performance.
- Mentors collect and classify topical learning resources and then share between mentors

#### Utilities

- Any User opens a chatbot in the system and recieves support on how to use the system, or receives guidance on assignement or other questions.

#### VR Later

- Mentors and Mentees meet in Virtual Reality and then remote work and virtual workspaces become a place where people can collaborate more effectively and express themselves more fully.

#### Integrations

- Marketing can use data to create graphs to easily identify and define trends
- Marketing does ? - email campaigns, addWords campaigns, others?
- Marketing member clicks a button and then donor receipts are sent out

- Accounts and ledgers provide all needed documentation for tax purposes
- Accounts and Ledgers provide meaningful metrics to the board
- Accountant is able to easily track spending and expenses in an easy and transparent way to share with board
- Finance - does ? - end-of-year receipts, taxes, payroll, reporting?
- Accounts and Ledgers import and reconcile with bank statements
