# AWS Foundations — Day 2 Review

## Date

July 10, 2026

## Shared Responsibility Model

**Simple explanation:**  
AWS protects the physical cloud infrastructure, while customers protect their data, accounts, permissions, applications, and configurations.

**Real-world example:**  
AWS secures the physical server running an EC2 instance, but I must update the operating system, configure the security group, and protect the data inside the instance.

**Common exam clue:**  
Questions asking about physical facilities, hardware, or the virtualization layer usually refer to AWS responsibility. Questions about customer data, IAM permissions, and EC2 operating-system patches usually refer to customer responsibility.

**One thing I still do not understand:**  
How customer responsibilities change when using highly managed services compared with EC2.

---

## IAM

**Simple explanation:**  
AWS Identity and Access Management controls who can access AWS and what actions they are allowed to perform.

**Real-world example:**  
An EC2 application that needs to read files from S3 can use an IAM role with permission to read only the required bucket.

**Common exam clue:**  
Questions mentioning temporary permissions for an AWS service usually point to an IAM role. Questions mentioning minimum required access usually point to least privilege.

**One thing I still do not understand:**  
How IAM policies are evaluated when several allow and deny statements apply at the same time.

---

## AWS Regions and Availability Zones

**Simple explanation:**  
A Region is a separate geographic area containing AWS infrastructure. An Availability Zone is an isolated infrastructure location inside a Region.

**Real-world example:**  
A company can deploy an application across two Availability Zones so that it remains available if one Availability Zone has a problem.

**Common exam clue:**  
Questions about geographic location, data residency, and service availability usually refer to Regions. Questions about high availability and fault tolerance inside one Region usually refer to multiple Availability Zones.

**One thing I still do not understand:**  
How applications automatically fail over between Availability Zones.

---

## Amazon EC2

**Simple explanation:**  
Amazon EC2 provides resizable virtual servers in AWS.

**Real-world example:**  
A company can move an existing web application to an EC2 instance and install the operating system, software, and dependencies it needs.

**Common exam clue:**  
Questions requiring full control of an operating system, long-running applications, or custom server software usually point to EC2.

**One thing I still do not understand:**  
How to choose between On-Demand Instances, Spot Instances, Savings Plans, and Reserved Instances.

---

## Amazon S3

**Simple explanation:**  
Amazon S3 is scalable object storage for files such as images, documents, backups, logs, and static website content.

**Real-world example:**  
A portfolio website can store HTML, CSS, JavaScript, images, and résumé files inside an S3 bucket.

**Common exam clue:**  
Questions involving object storage, backups, static website files, high durability, or lifecycle policies usually point to S3.

**One thing I still do not understand:**  
How to select the best S3 storage class based on access frequency, retrieval time, and cost.

---

## Memory Review

- AWS protects security **of** the cloud.
- Customers protect security **in** the cloud.
- IAM controls identity and permissions.
- A Region contains multiple Availability Zones.
- EC2 provides virtual servers.
- S3 stores files as objects inside buckets.
