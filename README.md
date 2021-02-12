# tfecs
This repository code can be used to deploy containerized WordPress application on to AWS ECS with database on RDS MySQL.

## Key features:
* Creates a VPC with public & private subnet along with IGW & NGW for internet access, different security groups for each layers (ELB, EC2 & RDS)
* Creates Bastion & ELB instances in public subnet
* Bastion host for SSH from outside and internal instances are allowed from Bastion only
* ECS service tasks will receive traffic from ELB
* ECS EC2 and RDS instances are created in private subnets
* MySQL RDS will only be accessible from Bastion & ECS EC2 instances
* ECS containers logs onto CloudWatch logs

## How to use
* Install Terraform (0.12 or newer)
& Clone repository
```
git clone https://github.com/bhoslepu/tfecs
cd tfecs
```
* Copy terraform.tfvars.example to terraform.tfvars
* Update values in terraform.tfvars.
* Run terraform init and then terraform plan/apply


## Enhancements/Improvements for security:
* ELB is configured with HTTP, but it should be only on HTTPS. In code, there is provision for configuring HTTPS on ELB and redirection of HTTP to HTTPS. SSL certificate will require for this, AWS ACM certificate could be simple, secure and easy option to validate certificates.
* Currently password for RDS is in plain text. This should be encrypted or retrieved any secret manager. AWS parameter group or secret manager can be used for this. AWS secret manager provides functionality of auto-rotation of passwords.
* Encryption of disks for RDS.
* Only a group (of required users) should have access to ECS/RDS services through IAM.
* Providing instances access to users through SSH key manager tools, example - userify.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| compute | ./modules/compute |  |
| ecs | ./modules/ecs |  |
| iam | ./modules/iam |  |
| network | ./modules/network |  |
| rds | ./modules/rds |  |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| desired\_capacity | n/a | `string` | `"1"` | no |
| ecs\_cluster\_name | n/a | `string` | `"wpcluster"` | no |
| env | n/a | `string` | `"demo"` | no |
| max\_instance\_size | n/a | `string` | `"3"` | no |
| min\_instance\_size | n/a | `string` | `"1"` | no |
| private\_subnet\_cidr-az1 | n/a | `string` | `"172.20.20.0/24"` | no |
| private\_subnet\_cidr-az2 | n/a | `string` | `"172.20.21.0/24"` | no |
| private\_subnet\_name-az1 | n/a | `string` | `"private-1"` | no |
| private\_subnet\_name-az2 | n/a | `string` | `"private-2"` | no |
| public\_subnet\_cidr-az1 | n/a | `string` | `"172.20.10.0/24"` | no |
| public\_subnet\_cidr-az2 | n/a | `string` | `"172.20.11.0/24"` | no |
| public\_subnet\_name-az1 | n/a | `string` | `"public-1"` | no |
| public\_subnet\_name-az2 | n/a | `string` | `"public-2"` | no |
| region | n/a | `string` | `"ap-south-1"` | no |
| region-az1 | n/a | `string` | `"ap-south-1a"` | no |
| region-az2 | n/a | `string` | `"ap-south-1c"` | no |
| region-key | n/a | `string` | `"devops"` | no |
| vpc\_cidr | n/a | `string` | `"172.20.0.0/16"` | no |
| vpc\_name | n/a | `string` | `"ecsdemo"` | no |

## Outputs

No output.
