#!/usr/bin/env bash
source scripts/config.sh

# Message Font
CYAN="\e[36m"
BOLD=$"\e[1m"
DEFAULT="\e[39m"

if aws s3api head-bucket --bucket $HANDLER_BUCKET 2>/dev/null; then
  printf "\n${BOLD}${CYAN}Clearing resource bucket ...${DEFAULT}\n"
  aws s3 rm s3://$HANDLER_BUCKET --recursive
else
  printf $"\n${BOLD}${CYAN}Creating S3 bucket: $HANDLER_BUCKET ...${DEFAULT}\n"
  aws s3api create-bucket --bucket $HANDLER_BUCKET \
    --region $REGION \
    --create-bucket-configuration LocationConstraint=$REGION
fi

gradle build

printf "\n${BOLD}${CYAN}Pushing target to bucket ...${DEFAULT}\n"
aws s3api put-object \
  --bucket $HANDLER_BUCKET \
  --key $HANDLER_KEY \
  --body $HANDLER_BODY

printf $"\n${BOLD}${CYAN}Deploying CloudFormation Stack: STACK ...${DEFAULT}\n"
aws cloudformation deploy \
  --template-file configuration/cloudFormation/template.yml \
  --stack-name $STACK \
  --parameter-overrides \
  BucketName=$HANDLER_BUCKET \
  HandlerKey=$HANDLER_KEY \
  Tier=$TIER \
  --capabilities CAPABILITY_IAM