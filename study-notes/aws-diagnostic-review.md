# AWS Cloud Practitioner Diagnostic Review

## Assessment Information

- Date reviewed: July 10, 2026
- Original score: 4/20
- Original percentage: 20%
- Questions reviewed below: 10
- Note: My selected answers were not preserved in the screenshots, so I recorded them as not captured rather than guessing.

---

## Question Topic 1 — EC2 Purchasing Options

**What I picked:** Not captured during the diagnostic.

**Correct answer:** Amazon EC2 Spot Instances.

**Why the correct answer is right:** Spot Instances use unused AWS compute capacity and can be purchased at a major discount compared with On-Demand Instances. They can be interrupted when AWS needs the capacity back.

**What concept I need to study:** On-Demand Instances, Spot Instances, Savings Plans, Reserved Instances, and when each purchasing option is appropriate.

---

## Question Topic 2 — Deploying Across Availability Zones

**What I picked:** Not captured during the diagnostic.

**Correct answer:** Deploying across multiple Availability Zones improves availability and fault tolerance.

**Why the correct answer is right:** If one Availability Zone experiences a failure, resources in another Availability Zone can continue serving the application.

**What concept I need to study:** Regions, Availability Zones, high availability, redundancy, fault tolerance, and failover.

---

## Question Topic 3 — AWS Support Plans

**What I picked:** Not captured during the diagnostic.

**Correct answer:** Business Support was the minimum plan expected by the diagnostic question for technical phone support.

**Why the correct answer is right:** Basic Support does not provide technical support cases. Premium business-level support provides access to AWS technical experts through channels that include phone support.

**Current-plan note:** AWS is transitioning from Developer and Business Support to Business Support+. I should check the current AWS documentation while also recognizing the terminology used by CLF-C02 practice materials.

**What concept I need to study:** Basic Support, business-level support, Enterprise Support, response times, Trusted Advisor, and Technical Account Managers.

---

## Question Topic 4 — Dedicated On-Premises Connection

**What I picked:** Not captured during the diagnostic.

**Correct answer:** AWS Direct Connect.

**Why the correct answer is right:** Direct Connect establishes a dedicated network connection between an organization’s network and an AWS Direct Connect location without relying only on the normal public-internet path.

**What concept I need to study:** AWS Direct Connect compared with AWS Site-to-Site VPN.

---

## Question Topic 5 — AWS Lambda Pricing

**What I picked:** Not captured during the diagnostic.

**Correct answer:** Lambda is primarily charged according to the number of requests and the execution duration or compute resources used.

**Why the correct answer is right:** Lambda is a serverless service, so customers pay based on function usage rather than paying for an always-running server.

**What concept I need to study:** Requests, duration, allocated memory, the Lambda free tier, and provisioned concurrency.

---

## Question Topic 6 — Centralized Account Governance

**What I picked:** Not captured during the diagnostic.

**Correct answer:** AWS Organizations.

**Why the correct answer is right:** AWS Organizations helps centrally manage multiple AWS accounts and supports consolidated billing through a management account.

**What concept I need to study:** Management accounts, member accounts, organizational units, service control policies, and consolidated billing.

---

## Question Topic 7 — Amazon S3 Characteristics

**What I picked:** Not captured during the diagnostic.

**Correct answer:** Amazon S3 is scalable object storage used to store files and other objects inside buckets.

**Why the correct answer is right:** S3 is designed for object storage use cases such as backups, application files, logs, images, data lakes, and static website content.

**What concept I need to study:** Buckets, objects, durability, availability, versioning, lifecycle rules, and storage classes.

---

## Question Topic 8 — Relational Databases

**What I picked:** Not captured during the diagnostic.

**Correct answer:** Amazon RDS.

**Why the correct answer is right:** Amazon RDS is a managed service for running relational databases in AWS.

**What concept I need to study:** Relational databases compared with DynamoDB, database engines, backups, read replicas, and Multi-AZ deployments.

---

## Question Topic 9 — Encrypted Connection Over the Internet

**What I picked:** Not captured during the diagnostic.

**Correct answer:** AWS Site-to-Site VPN.

**Why the correct answer is right:** A Site-to-Site VPN creates encrypted IPsec tunnels between an on-premises network and AWS while using an internet connection.

**What concept I need to study:** Site-to-Site VPN, Client VPN, Direct Connect, customer gateways, and virtual private gateways.

---

## Question Topic 10 — Discovering Sensitive S3 Data

**What I picked:** Not captured during the diagnostic.

**Correct answer:** Amazon Macie.

**Why the correct answer is right:** Amazon Macie discovers and reports sensitive data stored in Amazon S3 by using machine learning and pattern matching.

**What concept I need to study:** Amazon Macie, Amazon GuardDuty, AWS Security Hub, Amazon Inspector, and AWS Shield.

---

# Required Focus Review

## Shared Responsibility Model

AWS is responsible for security of the cloud, including the physical facilities, hardware, networking infrastructure, and virtualization layer.

Customers are responsible for security in the cloud, including data, credentials, IAM permissions, security configurations, and the guest operating system on EC2.

## IAM

- User: Long-term identity
- Group: Collection of users
- Role: Temporary permissions that can be assumed
- Policy: Defines allowed or denied actions
- Least privilege: Grant only the permissions required

## EC2 Compared with Lambda

- EC2 provides a virtual server that the customer manages.
- Lambda runs event-driven code without requiring the customer to manage servers.

## S3 Storage Classes

- S3 Standard: Frequently accessed data
- S3 Intelligent-Tiering: Data with changing or unknown access patterns
- S3 Standard-IA: Infrequently accessed data that still needs rapid retrieval
- S3 One Zone-IA: Infrequently accessed, reproducible data stored in one Availability Zone
- S3 Glacier classes: Long-term archives with different retrieval speeds and costs

## CloudWatch Compared with CloudTrail

- Amazon CloudWatch monitors resources, metrics, logs, alarms, and operational health.
- AWS CloudTrail records account activity and API actions, including who performed an action and when it occurred.

## Pricing and Billing

Important pricing concepts include:

- Pay only for the resources used
- On-Demand pricing
- Savings Plans and longer-term commitments
- Spot pricing for interruptible spare capacity
- Consolidated billing through AWS Organizations
- AWS Cost Explorer and AWS Budgets
- Data-transfer charges
- Different prices across AWS Regions

## Main Study Priorities

1. AWS service identification
2. Security and IAM
3. Pricing and billing
4. AWS Support plans
5. Networking connections
6. Storage classes
7. Monitoring compared with auditing

