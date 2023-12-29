# Solution Architecture

These diagrams utilize the [mermaid flowchart library](https://mermaid.js.org/syntax/flowchart.html), you may need to install an IDE plugin to preview these diagrams. The vsCode extion bierner.markdown-mermaid is a good option.

- [Microservice Architecture](#micorservices-and-source-code-repos)
- [Infrastructure](#infrastructure)
- [Continous Integration](#continous-integration)
- [Continous Delivery](#continous-delivery)

## Micorservices and source code repos

Bounded Domains and Eventually Consistant data, architecture.yaml has details.
Domain source/sync configurations

A special note about the Search domain

Integration domains use request(sync)/reply(source) collections to implement asyncronous functionality. The solution can scale databases along service domains as each domain will be the source for one (or a few) collections, and other domains can use an eventually consistant copy in a read only fashion.

```mermaid
flowchart LR
    APIG((URL Router))
    BUS(AWS Event Stream)
    --> DataLake[(Data Lake)]

    APIG 
    --> SearchUI([mentorHub-search-ui])
    subgraph Search Dashboard
        SearchUI
        --> SearchAPI(mentorHub-search-api)
        --> SearchDB[(Atlas
            Search)]
    end
    SearchDB --> BUS

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
    --> CirriculumUI([mentorHub-cirriculum-ui])
    --> CirriculumAPI(mentorHub-cirriculum-api)
    --> CirriculumDB[(Cirriculum)]
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
        eMail>Mailchimp]
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

```

    Auth0 
    --> BUS

    subgraph mentorHub-mongodb
        PersonDB
        TopicsDB
        PartnerDB
        CirriculumDB
        EncounterDB
        IdentityDB
        eMailDB
    end

## Infrastructure

The following diagram identifies the cloud infrastructure used by the mentorHub platform

```mermaid
flowchart LR
    ELB(ELB Elastic Load Balancer)
    --> EKS(EKS Elastic K8S Service)
    --> AEB(AWS Event Bridge)
    --> SNS(SNS Simple Notification Service)
    --> EDB(AWS Elastic DocumentDB)
    --> KMS(Key Management Service)

```

## Networking

```mermaid
flowchart LR
    DNS(Amazon Route53 DNS)
    --> CDN(Amazon Cloudfront CDN)
    --> IG(Internet Gateway)
    --> NACL(Network ACL)
    --> SG(Stateful security group)
```

## Storage

```mermaid
flowchart LR
    S3(Simple Storage Service S3 Buckets)
    --> ADB(Amazon DocumentDB with Mongo Compatability)
    --> DataWarehouse(Redshift Data Warehouse)
    --> DataLake(Lake) 

```

## Continous Integration

```mermaid
flowchart LR
    REPO(GitHub Repository)
    --> CI(GitHub Actions) 
    --> GCR(Github Container Registry)
    --> Next(TBD)
```

## Continous Delivery

```mermaid
flowchart LR
    DEV 
    --> TEST 
    --> STAGE 
    --> PROD
```
