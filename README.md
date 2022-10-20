# one2onetool

I have used github actions to create a workflow. Release branch has environment variable "DATA_FILE" and staging branch does not have it. email will be sent out after the job completion with the status. codeql has been used for verifying the quality of the code after which the build will start.

I have added files "Dockerfile" -- for docker build of nodejs image , "assignment-task.json" --- for task definition and container definition to be used in AWS ECS. ".foreverignore" --- for using forever to start the service in cmd of docker.

image tag is changed to have "master-one2oneapp" in master branch, stage-one2oneapp in staging branch and release-one2oneapp in release branch.

in AWS : we have created an ecs repository with name "assignment21jul". we have created an ecs cluster with name "assignment-cluster". we have added a service within the cluster with name "assignment-service" we have added vpc network with host network enabled on port 3000. we have created sample container template with name "assignment-container". we have enabled VPC (subnet) to assign dynamic public ipv4 addresses.

after triggering the work flow from github actions, deployment completed successfully and services tested with loadbalancer dns and port number 3000.
