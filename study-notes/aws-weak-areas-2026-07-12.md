# AWS Weak Areas — 2026-07-12

## Edge Locations

Simple explanation:
Edge locations are AWS locations closer to users that help deliver content faster.

Real-world example:
If someone visits my portfolio from far away, CloudFront can serve cached files from an edge location closer to them instead of always going back to the main S3 origin.

Exam clue:
Look for words like low latency, caching, content delivery, global users, or CloudFront.

Common mistake:
Thinking edge locations are the same as Regions or Availability Zones.

My final one-sentence memory hook:
Edge locations bring cached content closer to users.

---

## Private Subnets

Simple explanation:
A private subnet is a subnet that does not have a direct route to the internet through an Internet Gateway.

Real-world example:
A database should usually be placed in a private subnet so people on the internet cannot directly reach it.

Exam clue:
Look for internal resources, databases, no direct internet access, or protected backend systems.

Common mistake:
Thinking private subnet means no internet access at all. A private subnet can still reach the internet through a NAT Gateway.

My final one-sentence memory hook:
Private subnets protect resources from direct internet access.

---

## S3 Standard vs S3 Glacier

Simple explanation:
S3 Standard is for active files that need fast access. S3 Glacier is for cheaper archive storage with slower retrieval.

Real-world example:
My portfolio HTML, CSS, images, and resume should use S3 Standard. Old backups or archived logs could use S3 Glacier.

Exam clue:
Use S3 Standard when data needs frequent or fast access. Use Glacier when the question says archive, long-term, low-cost, or rarely accessed.

Common mistake:
Using S3 Glacier for active website files.

My final one-sentence memory hook:
S3 Standard is for active files, while S3 Glacier is for archived files.

---

## VPC Routing

Simple explanation:
VPC routing controls where network traffic goes using route tables.

Real-world example:
A public subnet can send internet-bound traffic to an Internet Gateway using a route like `0.0.0.0/0 -> Internet Gateway`.

Exam clue:
Look for route table, default route, internet access, public subnet, private subnet, NAT Gateway, or Internet Gateway.

Common mistake:
Thinking a subnet is public just because it has a public IP. The route table must route internet traffic to an Internet Gateway.

My final one-sentence memory hook:
Route tables decide where network traffic goes.

---

## CloudFront vs S3 Website Endpoint

Simple explanation:
S3 stores and can serve static website files. CloudFront is a CDN that delivers those files faster and more securely through edge locations.

Real-world example:
My portfolio files can live in S3, while CloudFront delivers them to visitors with caching and HTTPS support.

Exam clue:
Use S3 for object storage/static files. Use CloudFront for global delivery, caching, HTTPS, and lower latency.

Common mistake:
Thinking CloudFront is the main storage location. S3 stores the files; CloudFront delivers them.

My final one-sentence memory hook:
S3 stores the site, CloudFront delivers the site.

---

## Security Group vs NACL

Simple explanation:
Security Groups protect resources like EC2 instances. NACLs protect subnets.

Real-world example:
A Security Group can allow HTTPS traffic to a web server. A NACL can allow or deny traffic at the subnet boundary.

Exam clue:
Security Group = instance/resource level, stateful, allow rules. NACL = subnet level, stateless, allow and deny rules.

Common mistake:
Forgetting that Security Groups are stateful and NACLs are stateless.

My final one-sentence memory hook:
Security Groups protect resources, while NACLs protect subnets.

---

## CloudWatch vs CloudTrail

Simple explanation:
CloudWatch is for monitoring metrics, logs, and alarms. CloudTrail records AWS API activity and account actions.

Real-world example:
CloudWatch can alarm when an EC2 instance has high CPU. CloudTrail can show who deleted an S3 bucket.

Exam clue:
CloudWatch = metrics, logs, alarms, monitoring. CloudTrail = who did what, API calls, auditing, account history.

Common mistake:
Using CloudTrail for performance metrics or CloudWatch for account activity history.

My final one-sentence memory hook:
CloudWatch watches performance; CloudTrail tracks actions.
