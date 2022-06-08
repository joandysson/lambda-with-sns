#!/usr/bin/env bash

if ! command -v aws >/dev/null 2>&1; then
    echo 'aws cli is not installed'
    exit 1
fi

if [ ! -f function.zip ]; then
    printf 'You need to create a function.zip with all project files before you can run this script\n'
    read -p 'Would you like to create a function.zip? (y/n) ' -n 1 -r
    if ! [[ $REPLY =~ ^[Yy]$ ]]; then
        print 'is not possible to continue without a function.zip'
        exit 1
    fi

    if ! command -v zip &> /dev/null; then
        printf 'You need to install zip'
        exit 1
    fi

    zip -r function.zip . > /dev/null
fi

printf 'Creating the SNS topic\n'
aws --no-cli-pager --endpoint-url=http://0.0.0.0:4566 sns create-topic --name events-topic

printf 'Uploading function.zip to AWS Lambda and creating lambda function\n'
aws --no-cli-pager --endpoint-url=http://0.0.0.0:4566 lambda create-function --function-name events-lambda \
    --zip-file fileb://function.zip --handler index.handler --runtime nodejs12.x --role _

printf 'Subscribing lambda to SNS topic\n'
aws --no-cli-pager --endpoint-url=http://0.0.0.0:4566 sns subscribe --topic-arn arn:aws:sns:us-east-1:000000000000:events-topic --protocol lambda \
--notification-endpoint arn:aws:lambda:us-east-1:000000000000:function:events-lambda


read -p 'Would you like to send a test message to the SNS topic? (y/n) ' -n 1 -r

if [[ $REPLY =~ ^[Yy]$ ]]; then
    aws --no-cli-pager sns publish --endpoint-url=http://0.0.0.0:4566 --topic-arn arn:aws:sns:us-east-1:000000000000:events-topic \
    --message '{"name":"test", "user_id":1, "properties": {"nickname": "test-user1", "job": "Software engineer"}}'
fi
