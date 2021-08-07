# Kubernetes (K8S) demo app

## Docker build proces

Build the app inside the container instead of the local dev environment
`docker build -f dockerfile.dev -t jaricheu/k8s-demo .`

Build the app for production
`docker build -f dockerfile.prod -t jaricheu/k8s-demo:v1.0.0 .`

Build the app from git
`docker build https://github.com/jarichypma/k8s-demo.git#main -t jaricheu/k8s-demo`

## How to run in Docker

Read this: https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-to-the-container-registry

Run the app locally
`docker run -it --rm -p 8080:8080 jaricheu/k8s-demo`

## Pushing the image to github

Create an personal access token with package read, write and delete permissions
Set the token in .zshrc or .bashrc depending on what you use
authenticate: `echo $CR_PAT | docker login ghcr.io -u jarichypma --password-stdin`

tag the locally build image:
`docker tag 38f737a91f39 ghcr.io/OWNER/NEW_IMAGE_NAME:latest`
