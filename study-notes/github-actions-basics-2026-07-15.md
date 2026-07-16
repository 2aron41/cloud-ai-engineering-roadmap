# GitHub Actions Basics

## What is GitHub Actions?

GitHub Actions is an automation service built into GitHub. It can run repeatable tasks such as testing files, validating code, building applications, or deploying changes when an event happens in a repository.

## What is a workflow?

A workflow is an automated process described in a YAML file inside the repository's `.github/workflows/` directory.

A workflow can contain one or more jobs and can be configured to run after events such as a push, pull request, or manual request.

## What is a runner?

A runner is the computer or virtual machine that executes the workflow's commands.

GitHub can provide hosted runners, such as an Ubuntu virtual machine, or an organization can operate its own self-hosted runner.

## What is a trigger?

A trigger is the event that starts a workflow.

Examples include:

- Pushing a commit
- Opening a pull request
- Starting the workflow manually
- Running it on a schedule

## What does `on: push` mean?

`on: push` tells GitHub Actions to start the workflow when commits are pushed to the repository.

Branch filters can restrict the workflow so it only runs for an approved branch such as `main`.

## What is a job?

A job is a group of related workflow steps that run on the same runner.

A deployment workflow could have a job that validates the website, authenticates to AWS, uploads files, invalidates CloudFront, and verifies the deployment.

## What is a step?

A step is one individual action or command inside a job.

Examples include:

- Checking out the repository
- Confirming that `website/index.html` exists
- Authenticating to AWS
- Running an S3 synchronization command
- Creating a CloudFront invalidation

## Why should deployment be automated?

Automation makes deployments repeatable and reduces mistakes caused by manually downloading, renaming, or uploading files.

It also creates a visible deployment history and can stop a deployment when validation fails.

## What can go wrong with automation?

Automation can cause problems when it is configured incorrectly.

Possible failures include:

- Deploying from the wrong branch
- Synchronizing the wrong directory
- Deleting necessary S3 objects
- Uploading invalid or incomplete website files
- Using the wrong S3 bucket
- Invalidating the wrong CloudFront distribution
- Giving the deployment role excessive permissions
- Exposing credentials or secrets
- Reporting success without verifying the live website

## Why should AWS access keys not be stored permanently in GitHub?

Long-term AWS access keys remain usable until they are disabled, deleted, or rotated.

If they are exposed through repository files, logs, secrets, or another security failure, someone could use them to access AWS resources.

A safer design uses GitHub Actions with AWS OIDC so the workflow receives temporary credentials for a restricted IAM role instead of storing permanent AWS access keys.

## Memory Hook

GitHub Actions runs repeatable tasks when something happens in your repository, like a push to `main`.
