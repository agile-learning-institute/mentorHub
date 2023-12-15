# mentorHub Specifications

The mentorHub platform serves the needs of staff, members, mentors, partners, and donors. The system's primary purpose is to give apprentices real-world experience working in a modern computing environment, and the full design-build-run SDLC for a cloud-native platform.

As the primary purpose of this platform is to provide experience to apprentices, we are taking a SRE-First approach to start by building out a realistic developer experience. We have a head start, and many developer experiences are actually ready to run.

The Roadmap below identifies that a significant portion of the "SRE First" **Now** scope has been completed, and while some effort has been put into polishing the *Hills* in the **Next** scope, items in the **Later** scope are largely place holders for ideas that are partially captured.

## Now (SRE First)

- [x] Sam the Software Engineer reads a repo readme and can eaisly set up their local development environment, build and locally test their code with local backing services.

- [x] Sam the Software Engineer approves a pull request, and merges a feature branch into the main branch and then multi-architectre containers are built and deployed into a container registry
- [x] Sree the SRE deploies a database management container and then schema constraints and migrations are executed when database configuration updates are required.
- [x] Sree the SRE opens an admin view in a SPA and then they can review Versions of different components of the system, configuration values, and other information helpful during incident response.
- [x] Tonya the Tester issues a single bash command and then the solution is available for local testing.
- [ ] A new container is deployed to a registry, and tagged for the DEV environment and then the development environment deployes the new container.

## Next

- [ ] Mentor updates an on-line cirriculum and then the system suggests content and warns if the work assigned exceeds the members commited capacity. Suggestions can be based on the following factors:
  - Current skills and desired speciality
  - Advances members stated goals

- [ ] Mentor reviews a self-assessment with a member, and then current skills are validated and incorporated into the cirriculum creation process.

- [ ] Member uses the system to follow along on their cirriculum and then the system can automatically keep track of progress and time commitments, improving the quality of resource information and adjusting the velocity of the member.

- [ ] Member researches target employers and finds a dream job description and then the system guides them through a process to create Goals that would build the perfect Dream Job Resume.

- [ ] Mentor selects a script for an encounter, and then eaisly records notes about the encounter in the members profile, and updates their cirriculum for the comming period.

- [ ] Sree the SRE runs a runbook script and then services from one environment are promtoted into another.

- [ ] Sree the SRE reviews a Promethius/Grafana monitoring portal including health information from system API's, and then they can view performance and throughput metrics to support incident response.

- [ ] Sam the Software Engineer creates black-box testing for thier components and then they can be more confident in the performance of their code, and they can provide a starting place for the SQA team to build automated end-to-end testing.

- [ ] Any user confirms that they want their data removed and then their account is deleted and any PII related to their identity is removed from the system in compliance with the EU General Data Protection Regulations (GDPR).

## Later

- [ ] Mentor/Mentees get to collaborate in realtime on the best curriculum

- [ ] Member signs up on SquareSpace and then their information is added to the mentorHub databases, and welcome abord email is sent that includes instructions on how to schedule introduction meeting, and how to get a userID for the system.

- [ ] Apollo the Apprentice clicks a button and is presented a tooling report w/ links to any failing or needed hardware or software issues to address.

- [ ] Members achieve a level of competency and we issue digital certifications
GitHub Usage stats on search dashboard

- [ ] Sree the SRE uses a discord bot and names a domain, source environment, and target environment and then the containers for that domain are promoted from the source environment  to the destination environment.

- [ ] Any User opens a chatbot in the system and recieves support on how to use the system, or receives guidance on assignement or other questions.

- [ ] Humanity, does Education Revolution and then People are empowered to create value, major progress towards the biggest problems occurs (climate, war, unsafe AI)

- [ ] Tech Industry, does Swiss Army Knife Professionals, and then AI is implemented and integrated in ways never seen before.

- [ ] Mentor, does Mentorship and then Mentee gains confidence and experience

- [ ] The commons, the public, have access to Open and accessible education and career training that has lots of value and then closes talent gap

- [ ] Mentors and Mentees meet in Virtual Reality and then remote work and virtual workspaces become a place where people can collaborate more effectively and express themselves more fully.

## Integrations

- Marketing can use data to create graphs to easily identify and define trends
- Marketing does ? - email campaigns, addWords campaigns, others?
- Marketing member clicks a button and then donor receipts are sent out

- Accounts and ledgers provide all needed documentation for tax purposes
- Accounts and Ledgers provide meaningful metrics to the board
- Accountant is able to easily track spending and expenses in an easy and transparent way to share with board
- Finance - does ? - end-of-year receipts, taxes, payroll, reporting?
- Accounts and Ledgers import and reconcile with bank statements
