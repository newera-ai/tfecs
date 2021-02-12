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

## Architecture_Diagram
![Architecture_Diagram.png](Architecture_Diagram.png)

## How to use
* Install Terraform (0.12 or newer)
* Clone repository code
```
git clone https://github.com/bhoslepu/tfecs
cd tfecs
```
* Copy terraform.tfvars.example to terraform.tfvars
* Update values in terraform.tfvars
* Run terraform commands
```
terraform init
terraform plan
terraform apply
```

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
| vpc\_name | VPC Name | `string` | `"ecsdemo"` | yes |
| ecs\_cluster\_name | ECS cluster name | `string` | `"wpcluster"` | no |
| region-key | pem key for connecting instances | `string` | `"devops"` | yes |
| desired\_capacity | ECS ASG instnace desired capacity | `string` | `"1"` | no |
| max\_instance\_size | ECS ASG instnace max capacity | `string` | `"3"` | no |
| min\_instance\_size | ECS ASG instnace min capacity | `string` | `"1"` | no |

## Outputs

No output.


## Enhancements/Improvements for security:
* ELB is configured with HTTP, but it should be only on HTTPS. In code, there is provision for configuring HTTPS on ELB and redirection of HTTP to HTTPS. SSL certificate will require for this, AWS ACM certificate could be simple, secure and easy option to validate certificates.
* Currently password for RDS is in plain text. This should be encrypted or retrieved any secret manager. AWS parameter group or secret manager can be used for this. AWS secret manager provides functionality of auto-rotation of passwords.
* Encryption of RDS instances disks and separate subnets.
* Only a group (of required users) should have access to ECS/RDS services through IAM.
* Providing instances access to users through SSH key manager tools, example - userify.
