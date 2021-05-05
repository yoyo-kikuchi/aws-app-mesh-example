!/usr/bin/env bash

set -e

if [ -z $AWS_ACCOUNT_ID ]; then
    echo "AWS_ACCOUNT_ID environment variable is not set."
    exit 1
fi

if [ -z $AWS_DEFAULT_REGION ]; then
    echo "AWS_DEFAULT_REGION environment variable is not set."
    exit 1
fi

AWS_CLI_VERSION=$(aws --version 2>&1 | cut -d/ -f2 | cut -d. -f1)
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
ECR_URL="${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"
ECR_IMAGE_PREFIX=${ECR_URL}/grpc_

ecr_login() {
    if [ $AWS_CLI_VERSION -gt 1 ]; then
        aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | \
            docker login --username AWS --password-stdin ${ECR_URL}
    else
        $(aws ecr get-login --no-include-email)
    fi
}

deploy_images() {
    echo "Deploying Color Client and Color Server images to ECR..."
    ecr_login
    for app in color_client color_server; do
        aws ecr describe-repositories --repository-name grpc_${app} >/dev/null 2>&1 || aws ecr create-repository --repository-name grpc_${app} >/dev/null
        docker build -t ${ECR_IMAGE_PREFIX}${app} ${DIR}/${app} --build-arg GO_PROXY=${GO_PROXY:-"https://proxy.golang.org"}
        docker push ${ECR_IMAGE_PREFIX}${app}
    done
}

deploy_stacks() {
    deploy_images
}

deploy_stacks