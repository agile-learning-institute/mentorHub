#!/bin/bash

# Repository name
NAME="$1"

aws ecr create-repository --repository-name "$NAME" --region us-east-1
docker tag ghcr.io/agile-learning-institute/"$NAME":latest 105886329607.dkr.ecr.us-east-1.amazonaws.com/"$NAME":latest
docker push 105886329607.dkr.ecr.us-east-1.amazonaws.com/"$NAME":latest

