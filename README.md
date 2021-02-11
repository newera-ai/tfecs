# tfecs
Provision ECS cluster for wordpress application with secure environment


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
