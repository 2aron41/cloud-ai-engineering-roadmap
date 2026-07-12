# AWS Recall — 2026-07-11

## Shared Responsibility Model

My answer:
AWS is responsible for security of the cloud. The customer is responsible for security in the cloud.

Confidence: High

After checking my notes:
- Correct: AWS handles the infrastructure, hardware, global network, and data centers.
- Missing: Customer responsibilities include identity, access, data, configuration, and workloads.
- Correction: AWS secures the cloud infrastructure. Customers secure what they put in the cloud.

## IAM User

My answer:
An IAM user is an identity for a person or application that needs access to AWS.

Confidence: Medium

After checking my notes:
- Correct: IAM users are identities inside an AWS account.
- Missing: IAM users can have credentials and permissions attached through policies or groups.
- Correction: An IAM user represents one person or workload and should only receive the permissions needed.

## IAM Role

My answer:
An IAM role gives temporary permissions that a user, application, or AWS service can assume.

Confidence: Medium

After checking my notes:
- Correct: Roles are used for temporary access.
- Missing: Roles are commonly used by AWS services like EC2 or Lambda.
- Correction: A role is an identity with permissions that can be assumed temporarily instead of using long-term credentials.

## IAM Policy

My answer:
An IAM policy is the permission document.

Confidence: High

After checking my notes:
- Correct: Policies define allowed or denied actions.
- Missing: Policies are written in JSON.
- Correction: An IAM policy is a JSON document that defines permissions for users, groups, and roles.

## Region

My answer:
A Region is an AWS infrastructure location in a geographic area.

Confidence: High

After checking my notes:
- Correct: Regions are separate geographic areas.
- Missing: Each Region contains multiple Availability Zones.
- Correction: A Region is a physical geographic area where AWS has multiple isolated Availability Zones.

## Availability Zone

My answer:
An Availability Zone is isolated infrastructure inside a Region.

Confidence: Medium

After checking my notes:
- Correct: Availability Zones are isolated locations within a Region.
- Missing: They are made up of one or more data centers.
- Correction: An Availability Zone is one or more isolated data centers inside a Region.

## Edge Location

My answer:
An Edge Location is a location closer to users that helps deliver content faster.

Confidence: Medium

After checking my notes:
- Correct: Edge Locations reduce latency by being closer to users.
- Missing: They are used by services like CloudFront.
- Correction: Edge Locations are AWS sites used to cache and deliver content closer to users.

## EC2

My answer:
EC2 is a virtual server in AWS.

Confidence: High

After checking my notes:
- Correct: EC2 provides virtual machines.
- Missing: Customers manage the operating system, patches, security groups, and scaling choices.
- Correction: EC2 gives resizable virtual servers that customers can configure and manage.

## Lambda

My answer:
Lambda runs code without managing servers.

Confidence: High

After checking my notes:
- Correct: Lambda is serverless compute.
- Missing: It is event-driven and charges based on usage.
- Correction: Lambda runs code in response to events without requiring server management.

## S3

My answer:
S3 stores files.

Confidence: High

After checking my notes:
- Correct: S3 stores files as objects.
- Missing: S3 is object storage, not block storage or a traditional file system.
- Correction: S3 is object storage for files, images, backups, logs, static websites, and other objects.

## VPC

My answer:
A VPC is a private network in AWS.

Confidence: Medium

After checking my notes:
- Correct: A VPC is an isolated network environment.
- Missing: VPCs contain subnets, route tables, gateways, and network security controls.
- Correction: A VPC is a logically isolated network where AWS resources can be launched and controlled.

## Public Subnet

My answer:
A public subnet has a route to the internet through an Internet Gateway.

Confidence: High

After checking my notes:
- Correct: A route to an Internet Gateway makes the subnet public.
- Missing: Resources also need proper public IPs and security rules to be reachable.
- Correction: A public subnet has a route table entry such as 0.0.0.0/0 pointing to an Internet Gateway.

## Private Subnet

My answer:
A private subnet does not have a direct route to the internet through an Internet Gateway.

Confidence: Medium

After checking my notes:
- Correct: Private subnets are not directly reachable from the internet.
- Missing: Private subnets may still access the internet through a NAT gateway.
- Correction: A private subnet has no direct route from the internet and is used for internal resources like databases.

## Route Table

My answer:
A route table decides where network traffic goes.

Confidence: High

After checking my notes:
- Correct: Route tables control traffic paths.
- Missing: Route tables are associated with subnets.
- Correction: A route table contains rules that direct subnet traffic to targets like local routes, Internet Gateways, or NAT Gateways.

## Internet Gateway

My answer:
An Internet Gateway connects a VPC to the internet.

Confidence: High

After checking my notes:
- Correct: Internet Gateways allow internet connectivity for VPC resources.
- Missing: A subnet route and security rules are also required.
- Correction: An Internet Gateway allows communication between a VPC and the internet when routing and security allow it.

## Security Group

My answer:
A Security Group is a firewall for an EC2 instance.

Confidence: High

After checking my notes:
- Correct: Security Groups protect instances.
- Missing: Security Groups are stateful and use allow rules.
- Correction: A Security Group is a stateful firewall for instances that controls inbound and outbound traffic.

## Network ACL

My answer:
A Network ACL is a firewall for a subnet.

Confidence: Medium

After checking my notes:
- Correct: NACLs protect subnets.
- Missing: NACLs are stateless and can allow or deny traffic.
- Correction: A Network ACL is a stateless subnet-level firewall with allow and deny rules.

## CloudWatch

My answer:
CloudWatch is for monitoring.

Confidence: High

After checking my notes:
- Correct: CloudWatch is used for monitoring.
- Missing: It collects metrics, logs, and can trigger alarms.
- Correction: CloudWatch monitors AWS resources using metrics, logs, dashboards, and alarms.

## CloudTrail

My answer:
CloudTrail records AWS API activity and shows who did what.

Confidence: High

After checking my notes:
- Correct: CloudTrail records account activity.
- Missing: It helps with auditing, security, and compliance.
- Correction: CloudTrail records AWS API calls and account activity for auditing and investigation.

## S3 Standard versus S3 Glacier

My answer:
S3 Standard is for frequently accessed data. S3 Glacier is for cheaper long-term storage.

Confidence: Medium

After checking my notes:
- Correct: Standard is for frequent access and Glacier is for archiving.
- Missing: Glacier has slower retrieval times.
- Correction: S3 Standard is for active data that needs fast access. S3 Glacier is for archival data that costs less but takes longer to retrieve.
