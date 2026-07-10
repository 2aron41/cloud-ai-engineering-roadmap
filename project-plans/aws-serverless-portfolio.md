# AWS Serverless Portfolio — Project Plan

## Project Status

Planned

## Project Goal

Build and deploy a personal portfolio website using serverless AWS services.

The project will demonstrate skills in cloud hosting, serverless computing, APIs, databases, monitoring, security, and automated deployment.

## Intended Users

- Recruiters
- Hiring managers
- Internship employers
- Visitors reviewing my technical projects

## Minimum Viable Product

- Public portfolio webpage
- About Me section
- Skills section
- Projects section
- Contact form
- Serverless backend
- Logging and monitoring
- Deployment documentation

## Planned AWS Services

### Amazon S3

Store the website files, images, and other static content.

### Amazon CloudFront

Deliver the website quickly through AWS edge locations.

### Amazon API Gateway

Provide an API endpoint for the contact form.

### AWS Lambda

Run Python code when the contact form is submitted.

### Amazon DynamoDB

Store contact-form submissions.

### Amazon CloudWatch

Record logs, errors, and application activity.

### AWS IAM

Control permissions between AWS services using least privilege.

## Planned Architecture Flow

1. A visitor opens the website.
2. CloudFront delivers the content.
3. The static files are stored in Amazon S3.
4. The visitor submits the contact form.
5. The form sends a request to API Gateway.
6. API Gateway triggers Lambda.
7. Lambda processes the submission.
8. Lambda stores the submission in DynamoDB.
9. CloudWatch records logs and errors.
10. IAM controls service permissions.

## Architecture Summary

```text
Visitor
   |
   v
CloudFront
   |
   v
Amazon S3

Contact Form
   |
   v
API Gateway
   |
   v
AWS Lambda
   |
   v
DynamoDB

Lambda Logs
   |
   v
CloudWatch
