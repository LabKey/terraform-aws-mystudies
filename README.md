# FDA MyStudies Terraform Module

Terraform module to create and configure the "backend" components of the FDA MyStudies platform.

<!-- markdownlint-disable -->
<!--- BEGIN_TF_DOCS --->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.55.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.55.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_alb"></a> [alb](#module\_alb) | terraform-aws-modules/alb/aws | >= 6.5.0 |
| <a name="module_endpoints"></a> [endpoints](#module\_endpoints) | terraform-aws-modules/vpc/aws//modules/vpc-endpoints | >= 3.0.0 |
| <a name="module_https_private_sg"></a> [https\_private\_sg](#module\_https\_private\_sg) | terraform-aws-modules/security-group/aws//modules/https-443 | >= 4.3.0 |
| <a name="module_lb_http_sg"></a> [lb\_http\_sg](#module\_lb\_http\_sg) | terraform-aws-modules/security-group/aws//modules/http-80 | >= 4.3.0 |
| <a name="module_lb_https_sg"></a> [lb\_https\_sg](#module\_lb\_https\_sg) | terraform-aws-modules/security-group/aws//modules/https-443 | >= 4.3.0 |
| <a name="module_office_ssh_sg"></a> [office\_ssh\_sg](#module\_office\_ssh\_sg) | terraform-aws-modules/security-group/aws//modules/ssh | >= 4.3.0 |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | >= 3.6.0 |

## Resources

| Name | Type |
|------|------|
| [aws_alb_listener.alb_https_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_listener) | resource |
| [aws_alb_target_group.default_target](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/alb_target_group) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_route53_zone.env_zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_ssl_cert_arn"></a> [alb\_ssl\_cert\_arn](#input\_alb\_ssl\_cert\_arn) | ARN of existing TLS Certificate to use with ALB | `string` | n/a | yes |
| <a name="input_alb_ssl_policy"></a> [alb\_ssl\_policy](#input\_alb\_ssl\_policy) | n/a | `string` | `"ELBSecurityPolicy-TLS-1-2-2017-01"` | no |
| <a name="input_azs"></a> [azs](#input\_azs) | A list of availability zones in the region | `list(string)` | `[]` | no |
| <a name="input_base_domain"></a> [base\_domain](#input\_base\_domain) | Base Domain used by applications to look-up hosted zone and make DNS records | `string` | `"lkpoc.labkey.com"` | no |
| <a name="input_bastion_user"></a> [bastion\_user](#input\_bastion\_user) | IAM user for logging into the bastion host | `string` | `"ec2-user"` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Set of tags to apply to resources | `map(any)` | n/a | yes |
| <a name="input_debug"></a> [debug](#input\_debug) | whether to increase verbosity of shell scripts or not | `bool` | `false` | no |
| <a name="input_formation"></a> [formation](#input\_formation) | Name of VPC and associated resources, used in config paths | `any` | n/a | yes |
| <a name="input_formation_type"></a> [formation\_type](#input\_formation\_type) | production \| development | `any` | n/a | yes |
| <a name="input_install_script_repo_branch"></a> [install\_script\_repo\_branch](#input\_install\_script\_repo\_branch) | (optional) branch of install script repo to checkout | `string` | `null` | no |
| <a name="input_install_script_repo_url"></a> [install\_script\_repo\_url](#input\_install\_script\_repo\_url) | url of the install script repo | `string` | `"https://github.com/LabKey/install-script.git"` | no |
| <a name="input_keypair_name"></a> [keypair\_name](#input\_keypair\_name) | name of existing keypair to use when creating EC2 | `string` | n/a | yes |
| <a name="input_office_cidr_A"></a> [office\_cidr\_A](#input\_office\_cidr\_A) | CIDR of authorized office A - used for SSM remote admin access to instances | `string` | `"199.76.89.158/32"` | no |
| <a name="input_office_cidr_B"></a> [office\_cidr\_B](#input\_office\_cidr\_B) | CIDR of authorized office B - used for SSM remote admin access to instances | `string` | `"199.76.89.152/32"` | no |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | path to the ssh private key used for provisioning instances | `string` | n/a | yes |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | list of private subnets to use when creating vpc | `list(string)` | n/a | yes |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | list of public subnets to use when creating vpc | `list(string)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-west-2"` | no |
| <a name="input_s3_state_bucket"></a> [s3\_state\_bucket](#input\_s3\_state\_bucket) | S3 bucket used to store terraform state | `string` | `""` | no |
| <a name="input_s3_state_region"></a> [s3\_state\_region](#input\_s3\_state\_region) | region of the S3 state bucket | `string` | `"us-west-2"` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | list of security groups to apply | `list(string)` | `[]` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | subnet to create instances in | `string` | `null` | no |
| <a name="input_user"></a> [user](#input\_user) | IAM name of user who last ran this script | `string` | `""` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | cidr block for vpc | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_base_domain"></a> [base\_domain](#output\_base\_domain) | n/a |
| <a name="output_igw_id"></a> [igw\_id](#output\_igw\_id) | n/a |
| <a name="output_vpc_alb_arn"></a> [vpc\_alb\_arn](#output\_vpc\_alb\_arn) | n/a |
| <a name="output_vpc_arn"></a> [vpc\_arn](#output\_vpc\_arn) | n/a |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |

<!--- END_TF_DOCS --->
<!-- markdownlint-restore -->
