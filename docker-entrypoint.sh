#!/bin/bash

rm -rf .terraform

AWS_ACCESS_KEY_VAR=`cat $AWS_ACCESS_KEY_FILE`
AWS_SECRET_KEY_VAR=`cat $AWS_SECRET_KEY_FILE`

export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_VAR
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_KEY_VAR

echo "**************************************************";
echo "The following environment variables are required:"
echo "- AWS_ACCESS_KEY_FILE"
echo "- AWS_SECRET_KEY_FILE"
echo "If you want to use remote config, please set:"
echo "- TERRAFORM_BUCKET"
echo "- TERRAFORM_STATE_FILE"
echo "- TERRAFORM_STATE_REGION"
echo "**************************************************";

if [ -n "$TERRAFORM_BUCKET" ] && [ -n "$TERRAFORM_STATE_FILE" ] && [ -n "$TERRAFORM_STATE_REGION" ];
then
    echo "fetch state file \"$TERRAFORM_STATE_FILE\" from Bucket \"$TERRAFORM_BUCKET\"";
    /bin/terraform remote config -backend=s3 \
                                 -backend-config="bucket=$TERRAFORM_BUCKET" \
                                 -backend-config="key=$TERRAFORM_STATE_FILE" \
                                 -backend-config="region=$TERRAFORM_STATE_REGION"
fi

/bin/terraform $@

