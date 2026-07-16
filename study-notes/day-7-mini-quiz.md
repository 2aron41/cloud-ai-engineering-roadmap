# Day 7 Mini Quiz

## 1. Why is manual deployment risky?
human error


## 2. What does GitHub Actions automate?
the process of testing, building, deployment, validation


## 3. What is the danger of storing AWS access keys in GitHub?
keys can be leaked


## 4. Why is OIDC safer?
short lived temporary credentials


## 5. What should the future deployment role be allowed to do?
Follow the principle of least privilege by allowing only website file updates in the specific portfolio S3 bucket and CloudFront invalidations for the specific portfolio distribution.


## 6. What should the future deployment role not be allowed to do?
must not have broad administrative permissions


## 7. Why should GitHub be the source of truth?
Deploying exclusively through code commits ensures every change is traceable, reviewable, and reproducible


## 8. What command or AWS action updates S3 website files?
`aws s3 sync website/ s3://2aron41-aws-portfolio-20260713/`; the underlying object-upload permission is `s3:PutObject`.


## 9. What AWS action refreshes CloudFront cached content?
cloudfront:CreateInvalidation


## 10. What test proves users cannot bypass CloudFront and access S3 directly?
Attempting to access your S3 static site file URLs directly using public S3 endpoints should return an access denied error
