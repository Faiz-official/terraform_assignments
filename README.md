Here is a sample `README.md` file based on the provided scenario and directory structure:

---

# AWS Multi-Tier Infrastructure Setup with Terraform

## Overview

This project sets up a highly available, scalable, and secure three-tier web application infrastructure on AWS using Terraform. The architecture includes:

- **VPC**: Virtual Private Cloud with public and private subnets.
- **Web Tier**: Autoscaling web servers behind an Elastic Load Balancer (ELB).
- **Application Tier**: EC2 instances in private subnets to handle application logic.
- **Database Tier**: RDS PostgreSQL instance in private subnets for storing data.
  
All components are modularized using Terraform modules to ensure reusability, and variables are used to make the setup flexible for different configurations.

## Directory Structure

```plaintext
terraform-assignment/
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── custom.tfvars
├── vpc/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── ec2/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── elb/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
├── rds/
│   ├── main.tf
│   ├── variables.tf
│   └── outputs.tf
```

### Description of Directories and Files

- **main.tf**: This file is the entry point where all the Terraform resources are invoked. It brings together the modules for VPC, EC2, ELB, and RDS.
  
- **variables.tf**: Contains all the variables required for parameterizing the infrastructure, including network ranges, instance types, and RDS configurations.
  
- **outputs.tf**: Defines the outputs for the infrastructure, such as ELB DNS name, RDS endpoint, and web server instance IDs.
  
- **providers.tf**: Specifies the AWS provider and region where the infrastructure will be deployed.

- **custom.tfvars**: File where custom values for variables can be set for different environments or configurations.

- **vpc/**: Contains the Terraform code for setting up the VPC, subnets, Internet Gateway, and route tables.
  
- **ec2/**: Manages the EC2 instances for web and application tiers, including the autoscaling groups and security groups.
  
- **elb/**: Configures the Elastic Load Balancer and its target groups for distributing traffic across the web servers.
  
- **rds/**: Sets up the RDS instance with a PostgreSQL engine and defines its subnet group.

## Requirements

- Terraform v1.0+
- AWS CLI
- AWS Account with necessary permissions to create VPC, EC2, ELB, and RDS resources.

## Setup and Deployment

### 1. Clone the repository

```bash
git clone git@github.com:Faiz-official/terraform_assignments.git
cd terraform-assignment
```

### 2. Initialize Terraform

Run the following command to initialize the Terraform environment, which will download all required providers and modules.

```bash
terraform init
```

### 3. Configure Variables

Edit the `custom.tfvars` file or pass in your variables directly to customize your deployment. For example:

```hcl
aws_region          = "ap-south-1"
vpc_cidr            = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = ["10.0.2.0/24", "10.0.3.0/24"]
instance_type       = "t2.micro"
ami_id              = "ami-04a37924ffe27da53"
db_username         = "admin"
db_password         = "strongpassword123"
db_instance_class   = "db.t3.micro"
```

### 4. Apply the Terraform Configuration

Apply the configuration to create the infrastructure:

```bash
terraform apply -var-file="custom.tfvars"
```

This command will provision all the resources as defined in the `main.tf` and module files.

### 5. Outputs

After Terraform finishes deploying, the following key outputs will be displayed:

- **elb_dns_name**: The DNS name for the Elastic Load Balancer, used to access the web tier.
- **rds_endpoint**: The endpoint URL of the RDS PostgreSQL database.
- **web_server_instance_ids**: The IDs of the web server EC2 instances.

### 6. Destroy the Infrastructure

To tear down the infrastructure and avoid ongoing costs, run:

```bash
terraform destroy -var-file="custom.tfvars"
```

## Modules Breakdown

### 1. VPC Module (`vpc/`)

This module creates a Virtual Private Cloud (VPC) with one public subnet (for web servers) and two private subnets (for application servers and the RDS database). It also sets up an Internet Gateway and route tables for proper routing.

### 2. EC2 Module (`ec2/`)

The EC2 module creates web and application servers using EC2 instances. It also sets up an autoscaling group for the web tier, a launch template for configuring the instances, and security groups for both the web and application tiers.

### 3. ELB Module (`elb/`)

This module configures an Elastic Load Balancer (ELB) to distribute traffic to the web tier. It sets up target groups and listener rules to ensure that the web servers receive traffic efficiently.

### 4. RDS Module (`rds/`)

The RDS module provisions a PostgreSQL database instance in the private subnet. It includes security group settings to allow traffic only from the application servers and sets up the necessary RDS parameter and subnet groups.
