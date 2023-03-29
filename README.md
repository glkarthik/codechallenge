
# DevOps Codechallege

The project containes terraform code to create an infrastructure which deploys a "helloworld {hostname}" program and AWS EKS container.

### Tools and Applications that are necessary to work with this codebase

1) Terraform v1.4.2
2) Kubectl v1.26
3) AWS Account [In my case I have used AcloudGuru]
4) Docker [This is used to create a custom image, in my case I have created a custom image using Docker and hosted in public Docker repo and the image name is mentioned below]
```bash
  image name: dockerhubkarthik/hello
```
### Initial Setup

1) Create AWS account with user having persmissions for programmatic access.
2) Use the access and secret key from step 1 and configure aws config in your local machine.

```bash
  aws configure
```
3) Once the infrastructure is deployed create Kubernetes context, so that the context is pointing to your cluster. This is helpful to run kubectl commands and verify your k8s deployment.

```bash
  aws eks --region {} update-kubeconfig --name {} --profile {}
```

### URL/DNS name of the deployed Helloworld service

Once the AWS infrastructure is deployed successfully using terraform, then navigate to EC2 > Load Balancer in your AWS account and use the DNS Name to invoke the service.

DNS Name : 
```bash
a422d453ed2df4033b6e1dxxxxxxxxx-0f30f75112798850.elb.us-east-1.amazonaws.com
```
Output of the Helloworld service "Hello World {hostname of the kubernetes pod} : 
```bash
Hello World helloworld-698bfbf8b6-qn2xm
```

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

provider.tf -- terraform providers used within this respository

vpc -- terraform file to create vpc. I have used 10.0.0.0/16 CIDR IP range.

igw.tf -- terraform file to create internet gateway in the infrastructure

subnets.tf -- terraform file to create the subnets in the infrastructure.

route.tf -- terraform file to create the route tables

eks.tf -- terraform file contains code to deploy the eks cluster

data.tf -- terraform file to retrieve the cluster data

variables.tf -- terraform file containing list of variables

manifest.tf -- terraform file containing yaml files to deploy the Helloworld application on AWS EKS.

helloworldcode -- this folder contains files required to create docker image
