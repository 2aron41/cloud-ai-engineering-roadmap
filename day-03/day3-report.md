# July 11 Day 3 Report

Completed:
- Completed closed-notes AWS recall.
- Improved AWS recall from 16/40 to stronger targeted recall.
- Scored 10/10 on Day 3 Round 1 AWS quiz.
- Scored 6/6 on missed-topic retry.
- Practiced Linux/macOS networking commands.
- Learned the difference between ping/ICMP and curl/HTTPS.
- Created linux-networking-notes.md.
- Created and pushed content-plan.md to the AWS Serverless Portfolio repo.
- Fixed GitHub Codespaces authentication issue using gh auth setup-git.

Not completed:
- None.

AWS recall score:
- Initial recall: 16/40
- Targeted retry: 15/18
- Round 1 quiz: 10/10
- Round 2 retry: 6/6

Fresh quiz score:
- 10/10

Linux commands practiced:
- pwd
- ls
- mkdir -p
- cd
- touch
- hostname
- whoami
- ifconfig
- ping -c 4 amazon.com
- curl -I https://aws.amazon.com

Problems encountered:
- The code command was not available on Mac Terminal.
- content-plan.md was first created in the home directory instead of the repo.
- Git push failed at first because Codespaces authentication did not have permission.
- ping amazon.com failed, but curl worked.

What I learned:
- Public subnets need a route to an Internet Gateway.
- Security Groups are instance-level and stateful.
- NACLs are subnet-level and stateless.
- CloudWatch is for metrics, logs, alarms, and monitoring.
- CloudTrail records AWS API activity.
- S3 is best for static website files.
- Vertical scaling means making servers bigger.
- Horizontal scaling means adding more servers.
- A failed ping does not always mean a website is down.

GitHub links:
- Cloud AI Engineering Roadmap:
- AWS Serverless Portfolio: https://github.com/2aron41/aws-serverless-portfolio
