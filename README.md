# medication-tracker

## Prerequisites
- Install [Homebrew](https://brew.sh/)
- Install the AWS CLI
    - `brew install awscli`
- Configure AWS CLI
    - `aws configure`
        - Use AWS Access Keys from your AWS IAM user
        - Region Name: `us-west-2`
        - Output Format: `json`

## Deployment
- `sh scripts/deploy.sh`
