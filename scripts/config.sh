#!/usr/bin/env bash

# Project
export REGION=$(aws configure get default.region)
export TIER="local"
export PACKAGE="medication-tracker.zip"

# S3
export HANDLER_BUCKET="medicationservice-${REGION}"
export HANDLER_KEY="${PACKAGE}-$(date +%s)"
export HANDLER_BODY="build/distributions/${PACKAGE}"

# CloudFormation
export STACK="medication-tracker-${TIER}"