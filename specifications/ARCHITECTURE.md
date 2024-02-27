# Solution Architecture

These diagrams utilize the [mermaid flowchart library](https://mermaid.js.org/syntax/flowchart.html), you may need to install an IDE plugin to preview these diagrams. The VS Code extension bierner.markdown-mermaid is a good option.

- [Microservice Architecture](#microservices-and-source-code-repos)
- [Infrastructure](#infrastructure)
- [Networking](#networking)
- [Storage](#storage)
- [Continuous Integration](#continuous-integration)
- [Continuous Delivery](#continuous-delivery)

## Microservices and source code repos

Bounded Domains and Eventually Consistent data, architecture.yaml has details.
Domain source/sync configurations

A special note about the Search domain

Integration domains use request(sync)/reply(source) collections to implement asynchronous functionality. The solution can scale databases along service domains as each domain will be the source for one (or a few) collections, and other domains can use an eventually consistent copy in a read only fashion.

```mermaid
flowchart LR
    APIG((URL Router))
    BUS(AWS Event Stream)
    --> DataLake[(Data Lake)]

    APIG --> SearchUI([mentorHub-search-ui])
    subgraph Search
        SearchUI
        --> SearchAPI(mentorHub-search-api)
        --> SearchService[(OpenSearch)]
        Lambda --> SearchService
    end
    Lambda <--> BUS
    
    APIG
    --> PersonUI([mentorHub-person-ui])
    --> PersonAPI(mentorHub-person-api)
    --> PersonDB[(Person)]
    --> BUS

    APIG
    --> PartnerUI([mentorHub-partner-ui])
    --> PartnerAPI(mentorHub-partner-api)
    --> PartnerDB[(Partner)]
    --> BUS

    APIG    
    --> TopicsUI([mentorHub-topics-ui])
    --> TopicsAPI(mentorHub-topic-api)
    --> TopicsDB[(Topics)]
    --> BUS

    APIG    
    --> CurriculumUI([mentorHub-curriculum-ui])
    --> CurriculumAPI(mentorHub-curriculum-api)
    --> CurriculumDB[(Curriculum)]
    --> BUS

    APIG    
    --> EncounterUI([mentorhub-encounter-ui])
    --> EncounterAPI(mentorHub-encounter-api)
    --> EncounterDB[(Encounter)]
    --> BUS

    APIG --> eMailUI([mentorhub-smtp-ui])
    subgraph SMTP Integration
        eMailUI
        --> eMailAPI(mentorHub-smtp-api)
        --> eMailDB[(eMail)]
        eMail>Mailchimp or SNS?]
        --> eMailAPI
    end
    eMailDB --> BUS

    APIG --> IdentityUI([mentorhub-identity-ui])    
    subgraph Identity Integration
        IdentityUI
        --> IdentityAPI(mentorHub-identity-api)
        --> IdentityDB[(Identity)]
        Auth0>Auth0]
        --> IdentityAPI
    end
    IdentityDB --> BUS

    Auth0 
    --> BUS

    subgraph mentorHub-mongodb
        PersonDB
        TopicsDB
        PartnerDB
        CurriculumDB
        EncounterDB
        IdentityDB
        eMailDB
    end

    click PersonUI href "https://github.com/agile-learning-institute/mentorHub-person-ui"
    click PersonAPI href "https://github.com/agile-learning-institute/mentorHub-person-api"
    click mentorHub-mongodb href "https://github.com/agile-learning-institute/mentorHub-mongodb"
    click PersonDB href "https://github.com/agile-learning-institute/mentorHub-mongodb"
    click TopicsDB href "https://github.com/agile-learning-institute/mentorHub-mongodb"
    click PartnerDB href "https://github.com/agile-learning-institute/mentorHub-mongodb"
    click CurriculumDB href "https://github.com/agile-learning-institute/mentorHub-mongodb"
    click EncounterDB href "https://github.com/agile-learning-institute/mentorHub-mongodb"
    click IdentityDB href "https://github.com/agile-learning-institute/mentorHub-mongodb"
    click eMailDB href "https://github.com/agile-learning-institute/mentorHub-mongodb"
    click TopicsAPI href "https://github.com/agile-learning-institute/mentorHub-topic-api"
    click PartnerAPI href "https://github.com/agile-learning-institute/mentorHub-partner-api"

```

## Infrastructure

The following diagram identifies the cloud infrastructure used by the mentorHub platform.

NOTE: This is incomplete, see the [Configure automation for Continuous Deployment Environments](https://github.com/agile-learning-institute/mentorHub/issues/12) issue for details.

```mermaid
flowchart LR
    ELB(ELB Elastic Load Balancer)
    --> EKS(EKS Elastic K8S Service)
    EKS --> KMS(Key Management Service)
    EKS <--> SNS(SNS Simple Notification Service)
    EKS --> AEB(AWS Event Bridge)
    AEB --> EDB(AWS Elastic DocumentDB)
    AEB --> AOS(AWS Open Search)
    subgraph Backing Services
        AEB
        SNS
        EDB
        KMS
        AOS
    end

```

## Networking

NOTE: This is incomplete, see the [Configure automation for Continuous Deployment Environments](https://github.com/agile-learning-institute/mentorHub/issues/12) issue for details.

```mermaid
flowchart LR
    DNS(Amazon Route53 DNS)
    --> CDN(Amazon Cloudfront CDN)
    --> IG(Internet Gateway)
    --> NACL(Network ACL)
    --> SG(Stateful security group)
```

## Storage

NOTE: This is incomplete, see the [Configure automation for Continuous Deployment Environments](https://github.com/agile-learning-institute/mentorHub/issues/12) issue for details.

```mermaid
flowchart TD
    S3(AWS S3 Buckets)
    ADB(AWS DocumentDB)
    Search(AWS OpenSearch)
    DataLake(Athena) 

```

## Continuous Integration

NOTE: This is incomplete, see the [Configure automation for Continuous Deployment Environments](https://github.com/agile-learning-institute/mentorHub/issues/12) issue for details.

```mermaid
flowchart LR
    REPO(GitHub Repository)
    --> CI(GitHub Actions) 
    --> GPR(Github Package Registry)
    --> Next(TBD Helm/Argo?)
    --> K8S(EKS)
```

## Continuous Delivery

The mentorHub platform utilizes four release management environments. Following the 12 factor principles the containers are built once, and then promoted between environments by adding tags to the containers. Environments are provisioned with Terraform automation. Provisioning a new environment (i.e. for training or sales purposes) is achieved with Terraform, deploying code to this new environment only requires adding a new tag to the images you want to deploy.

### DEV

This is a cloud hosted development environment. CI Automation deploys new code directly into this environment. Backing services in this environment are based on containerized database resources which contain test data, and can return to the know starting point by redeploying the containers.

### TEST

This is a cloud hosted testing environment, where end-to-end testing is done to assure the quality of the system before release. This environment also uses containerized backing databases to support automated testing. Once the SQA team determines that the new release has passed quality checks in this environment it can be deployed into the Staging environment.

### STAGE

This is the final Pre-Production environment. In this environment data from the Production environment is replicated into the Staging environment to test database migrations. One last QA check is done in this environment before deploying the release into Production.

### PROD

This is the live production environment.
