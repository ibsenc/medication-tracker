#!/usr/bin/env bash

FUNCTION_NAME="medication-tracker-local-LambdaFunction-1D9USUB905JAO"
#PAYLOAD="{\"path\":\"create\", \"title\":\"Conversation with Bill\", \"body\":\"We spoke about sprint work.\"}"
PAYLOAD="{'name':'test'}"
OUTPUT_FILE="output.txt"

echo $PAYLOAD

aws lambda invoke \
  --function-name $FUNCTION_NAME \
  --payload $PAYLOAD \
  $OUTPUT_FILE \
  >/dev/null

cat $OUTPUT_FILE
