# AWS Foundations — Day 2

## Date

July 10, 2026

## Global Infrastructure

### AWS Region

An AWS Region is a separate geographic area containing AWS infrastructure. Customers choose Regions based on proximity, service availability, price, compliance, and business requirements.

### Availability Zone

An Availability Zone is an isolated infrastructure location inside an AWS Region. Applications can use multiple Availability Zones to improve availability and fault tolerance.

### Edge Location

An edge location places content and services closer to users. Amazon CloudFront uses edge locations to deliver cached content with lower latency.

### Key Difference

- Region: Geographic area
- Availability Zone: Isolated location inside a Region
- Edge location: Content-delivery location close to users

## Shared Responsibility Model

### AWS Responsibility — Security of the Cloud

AWS protects:

- Physical facilities
- Physical servers
- Storage hardware
- Networking hardware
- Virtualization infrastructure

### Customer Responsibility — Security in the Cloud

The customer protects and configures:

- Account credentials
- IAM permissions
- Data
- Applications
- Security groups
- Guest operating systems on EC2
- Encryption settings

## EC2 Example

AWS manages the physical infrastructure and virtualization layer.

The customer manages the EC2 guest operating system, patches, installed applications, security-group rules, IAM access, and data.

## S3 Example

AWS manages the underlying storage infrastructure.

The customer controls bucket permissions, public access, encryption options, and the data stored in the bucket.

## Memory Statements

AWS is responsible for security **of** the cloud.

The customer is responsible for security **in** the cloud.

A Region contains multiple Availability Zones.

CloudFront uses edge locations to deliver content closer to users.

------------------------------------------------------------------------------------------------------------------
## Identity and Access Management

AWS Identity and Access Management controls who can access AWS resources and what actions they can perform.

### IAM User

An IAM user represents a person or application that needs long-term access to an AWS account.

### IAM Group

An IAM group contains users who need similar permissions.

### IAM Role

An IAM role provides temporary permissions and can be assumed by users, applications, or AWS services.

### IAM Policy

An IAM policy defines which AWS actions and resources are allowed or denied.

### Access Keys

An access key ID and secret access key are credentials used for programmatic access. Secret keys must never be stored in public GitHub repositories.

### Least Privilege

Least privilege means granting only the minimum permissions required to perform a task.

### EC2 Example

An EC2 application that needs access to Amazon S3 should use an IAM role instead of hard-coded access keys.

------------------------------------------------------------------------------------------------------------------
## Core Compute and Storage Services

### Amazon EC2

Amazon EC2 provides resizable virtual servers in AWS. Customers manage the guest operating system, installed applications, security groups, patches, and data.

Memory statement: EC2 is a virtual computer in the cloud.

### Amazon S3

Amazon S3 is scalable object storage. It stores objects such as images, documents, backups, logs, and static website files inside buckets.

Memory statement: S3 stores files and objects.

### AWS Lambda

AWS Lambda runs code in response to events without requiring the customer to provision or manage servers.

Lambda can respond to events such as an S3 upload, an API request, or a scheduled action.

Memory statement: Lambda runs event-driven code without server management.

## Main Differences

- EC2: Run and manage a virtual server
- S3: Store files and objects
- Lambda: Run code without managing servers

------------------------------------------------------------------------------------------------------------------
## Amazon VPC Basics

### VPC

Amazon VPC is a logically isolated virtual network inside AWS.

Memory statement: A VPC is my private network in AWS.

### Subnet

A subnet is a smaller range of IP addresses inside a VPC. AWS resources such as EC2 instances are launched into subnets.

### Public Subnet

A public subnet has a route to an internet gateway.

### Private Subnet

A private subnet does not have a direct route to an internet gateway.

### Route Table

A route table contains rules that determine where network traffic is directed.

### Internet Gateway

An internet gateway connects a VPC to the public internet.

### Security Group

A security group is a virtual firewall that controls allowed inbound and outbound traffic for resources such as EC2 instances.

### Network ACL

A network ACL controls allowed and denied traffic at the subnet level.

## Memory Statements

- VPC: Private network in AWS
- Subnet: Smaller network inside a VPC
- Route table: Directs network traffic
- Internet gateway: Connects a VPC to the internet
- Security group: Resource-level firewall
- Network ACL: Subnet-level traffic control