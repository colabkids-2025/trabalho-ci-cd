<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.76.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecr_repository) | resource |
| [aws_eip.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eks_access_entry.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_access_entry) | resource |
| [aws_eks_access_policy_association.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_access_policy_association) | resource |
| [aws_eks_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster) | resource |
| [aws_eks_node_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_openid_connect_provider.eks](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_openid_connect_provider.github](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.eks_cluster_node_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.eks_cluster_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role.github](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.github_actions_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.eks_cluster_node_group_AmazonEC2ContainerRegistryReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_cluster_node_group_AmazonEKSWorkerNodePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_cluster_node_group_AmazonEKS_CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks_cluster_role_AmazonEKSClusterPolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_internet_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.privates](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.publics](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.privates](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.publics](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.eks_cluster_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [tls_certificate.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assume_role"></a> [assume\_role](#input\_assume\_role) | n/a | <pre>object({<br/>    role_arn    = string<br/>    external_id = string<br/>  })</pre> | <pre>{<br/>  "external_id": "849dbd7d-22b1-4cf1-8438-21972d47f682",<br/>  "role_arn": "arn:aws:iam::390402531423:role/terraform-role"<br/>}</pre> | no |
| <a name="input_ecr_repositories"></a> [ecr\_repositories](#input\_ecr\_repositories) | n/a | <pre>list(object({<br/>    name                 = string<br/>    image_tag_mutability = string<br/>  }))</pre> | <pre>[<br/>  {<br/>    "image_tag_mutability": "MUTABLE",<br/>    "name": "colabkids/production/frontend"<br/>  },<br/>  {<br/>    "image_tag_mutability": "MUTABLE",<br/>    "name": "colabkids/production/backend"<br/>  }<br/>]</pre> | no |
| <a name="input_eks_cluster"></a> [eks\_cluster](#input\_eks\_cluster) | n/a | <pre>object({<br/>    name                              = string<br/>    role_name                         = string<br/>    enabled_cluster_log_types         = list(string)<br/>    access_config_authentication_mode = string<br/>    node_group = object({<br/>      name                        = string<br/>      role_name                   = string<br/>      instance_types              = list(string)<br/>      scaling_config_max_size     = number<br/>      scaling_config_min_size     = number<br/>      scaling_config_desired_size = number<br/>      capacity_type               = string<br/>    })<br/>  })</pre> | <pre>{<br/>  "access_config_authentication_mode": "API_AND_CONFIG_MAP",<br/>  "enabled_cluster_log_types": [<br/>    "api",<br/>    "audit",<br/>    "authenticator",<br/>    "controllerManager",<br/>    "scheduler"<br/>  ],<br/>  "name": "colabkids-eks-cluster",<br/>  "node_group": {<br/>    "capacity_type": "ON_DEMAND",<br/>    "instance_types": [<br/>      "t3.medium"<br/>    ],<br/>    "name": "colabkids-eks-cluster-node-group",<br/>    "role_name": "colabkidsEKSClusterNodeGroup",<br/>    "scaling_config_desired_size": 2,<br/>    "scaling_config_max_size": 2,<br/>    "scaling_config_min_size": 2<br/>  },<br/>  "role_name": "colabkidsEKSClusterRole"<br/>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region para deploy dos recursos | `string` | `"us-east-1"` | no |
| <a name="input_route53"></a> [route53](#input\_route53) | Configurações do Route 53 | <pre>object({<br/>    domain_name = string<br/>    zone_id     = optional(string)<br/>  })</pre> | <pre>{<br/>  "domain_name": "colabkids.com.br"<br/>}</pre> | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | <pre>{<br/>  "Environment": "production",<br/>  "Project": "colabkids"<br/>}</pre> | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | n/a | <pre>object({<br/>    name                     = string<br/>    cidr_block               = string<br/>    internet_gateway_name    = string<br/>    nat_gateway_name         = string<br/>    public_route_table_name  = string<br/>    private_route_table_name = string<br/>    eip                      = string<br/>    public_subnets = list(object({<br/>      name                    = string<br/>      map_public_ip_on_launch = bool<br/>      availability_zone       = string<br/>      cidr_block              = string<br/>    }))<br/>    private_subnets = list(object({<br/>      name                    = string<br/>      map_public_ip_on_launch = bool<br/>      availability_zone       = string<br/>      cidr_block              = string<br/>    }))<br/>  })</pre> | <pre>{<br/>  "cidr_block": "10.0.0.0/24",<br/>  "eip": "colabkids-vpc-eip",<br/>  "internet_gateway_name": "colabkids-vpc-internet-gateway",<br/>  "name": "colabkids-vpc",<br/>  "nat_gateway_name": "colabkids-vpc-nat-gateway",<br/>  "private_route_table_name": "colabkids-vpc-private-route-table",<br/>  "private_subnets": [<br/>    {<br/>      "availability_zone": "us-east-1a",<br/>      "cidr_block": "10.0.0.128/26",<br/>      "map_public_ip_on_launch": false,<br/>      "name": "colabkids-vpc-private-subnet-us-east-1a"<br/>    },<br/>    {<br/>      "availability_zone": "us-east-1b",<br/>      "cidr_block": "10.0.0.192/26",<br/>      "map_public_ip_on_launch": false,<br/>      "name": "colabkids-vpc-private-subnet-us-east-1b"<br/>    }<br/>  ],<br/>  "public_route_table_name": "colabkids-vpc-public-route-table",<br/>  "public_subnets": [<br/>    {<br/>      "availability_zone": "us-east-1a",<br/>      "cidr_block": "10.0.0.0/26",<br/>      "map_public_ip_on_launch": true,<br/>      "name": "colabkids-vpc-public-subnet-us-east-1a"<br/>    },<br/>    {<br/>      "availability_zone": "us-east-1b",<br/>      "cidr_block": "10.0.0.64/26",<br/>      "map_public_ip_on_launch": true,<br/>      "name": "colabkids-vpc-public-subnet-us-east-1b"<br/>    }<br/>  ]<br/>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_subnets_arn"></a> [private\_subnets\_arn](#output\_private\_subnets\_arn) | n/a |
| <a name="output_public_subnets_arn"></a> [public\_subnets\_arn](#output\_public\_subnets\_arn) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
<!-- END_TF_DOCS -->