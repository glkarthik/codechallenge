
# DevOps Codechallege

The project containes terraform code to create an infrastructure which deploys a "helloworld {hostname}" program and AWS EKS container.

### Tools and Applications that are necessary to work with this codebase

1) Terraform v1.4.2
2) Kubectl v1.26
3) AWS Account [In my case I have used AcloudGuru]
4) Docker [This is used to create a custom image, in my case I have created a custom image using Docker and hosted in public Docker repo]
```bash
  image name: dockerhubkarthik/hello
```
### Initial Setup

1) Create AWS account with user having persmissions for programmatic access.
2) Use the access and secret key from step 1 and configure aws config in your local machine.

```bash
  aws configure
```
3) Once the infrastructure is deployed create Kubernetes context, so that the context is pointing to your cluster. This is helpful to run kubectl commands.

```bash
  aws eks --region {} update-kubeconfig --name {} --profile {}
```

### URL/DNS name of the Helloworld service

Once terraform infrastructure is successfully deployed then navigate to EC2 > Load Balancer in your AWS account and use the DNS Name to hit the service.

### Steps to create the Helloworld service infrastructure

1) Clone the below github repo

```bash
https://github.com/glkarthik/codechallenge.git
```
2) Use the below commands in sequence to deploy the infrastructure

```bash
terraform init
terraform plan
terraform apply
```

### Files overview

provider.tf -- Terraform providers used within this respository

vpc -- vpc details. I have used 10.0.0.0/16 CIDR IP range. The range can be changed if you have already used 10.0.0.0/16 in your exisiting AWS account.

igw.tf -- to create internet gateway in the infrastructure

subnets.tf -- to create the subnets in the infrastructure. Remember to change the cidr_block range if you use different one.

route.tf -- to create the route tables 

eks.tf -- contains code to deploy the eks cluster

data.tf -- to retrieve the cluster data

variables.tf -- contains list of variables used

manifest.tf -- contains yaml files to deploy the Helloworld application on AWS EKS.

Docker -- this folder contains files required to create docker image