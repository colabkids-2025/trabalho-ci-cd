variable "tags" {
  type = map(string)
  default = {
    Environment = "production"
    Project     = "colabkids"
  }
}

variable "region" {
  description = "AWS region para deploy dos recursos"
  type        = string
  default     = "us-east-1"
}

variable "assume_role" {
  type = object({
    role_arn    = string
    external_id = string
  })
  default = {
    role_arn    = "arn:aws:iam::390402531423:role/terraform-role"
    external_id = "849dbd7d-22b1-4cf1-8438-21972d47f682"
  }
}

variable "vpc" {
  type = object({
    name                     = string
    cidr_block               = string
    internet_gateway_name    = string
    nat_gateway_name         = string
    public_route_table_name  = string
    private_route_table_name = string
    eip                      = string
    public_subnets = list(object({
      name                    = string
      map_public_ip_on_launch = bool
      availability_zone       = string
      cidr_block              = string
    }))
    private_subnets = list(object({
      name                    = string
      map_public_ip_on_launch = bool
      availability_zone       = string
      cidr_block              = string
    }))
  })

  default = {
    name                     = "colabkids-vpc"
    cidr_block               = "10.0.0.0/24"
    internet_gateway_name    = "colabkids-vpc-internet-gateway"
    nat_gateway_name         = "colabkids-vpc-nat-gateway"
    public_route_table_name  = "colabkids-vpc-public-route-table"
    private_route_table_name = "colabkids-vpc-private-route-table"
    eip                      = "colabkids-vpc-eip"
    public_subnets = [
      {
        name                    = "colabkids-vpc-public-subnet-us-east-1a"
        map_public_ip_on_launch = true
        availability_zone       = "us-east-1a"
        cidr_block              = "10.0.0.0/26"
      },
      {
        name                    = "colabkids-vpc-public-subnet-us-east-1b"
        map_public_ip_on_launch = true
        availability_zone       = "us-east-1b"
        cidr_block              = "10.0.0.64/26"
      }
    ]
    private_subnets = [
      {
        name                    = "colabkids-vpc-private-subnet-us-east-1a"
        map_public_ip_on_launch = false
        availability_zone       = "us-east-1a"
        cidr_block              = "10.0.0.128/26"
      },
      {
        name                    = "colabkids-vpc-private-subnet-us-east-1b"
        map_public_ip_on_launch = false
        availability_zone       = "us-east-1b"
        cidr_block              = "10.0.0.192/26"
      }
    ]
  }
}

variable "eks_cluster" {
  type = object({
    name                              = string
    role_name                         = string
    enabled_cluster_log_types         = list(string)
    access_config_authentication_mode = string
    node_group = object({
      name                        = string
      role_name                   = string
      instance_types              = list(string)
      scaling_config_max_size     = number
      scaling_config_min_size     = number
      scaling_config_desired_size = number
      capacity_type               = string
    })
  })

  default = {
    name      = "colabkids-eks-cluster"
    role_name = "colabkidsEKSClusterRole"
    enabled_cluster_log_types = [
      "api",
      "audit",
      "authenticator",
      "controllerManager",
      "scheduler"
    ]
    access_config_authentication_mode = "API_AND_CONFIG_MAP"
    node_group = {
      name                        = "colabkids-eks-cluster-node-group"
      role_name                   = "colabkidsEKSClusterNodeGroup"
      instance_types              = ["t3.medium"]
      scaling_config_max_size     = 2
      scaling_config_min_size     = 2
      scaling_config_desired_size = 2
      capacity_type               = "ON_DEMAND"
    }
  }
}

variable "ecr_repositories" {
  type = list(object({
    name                 = string
    image_tag_mutability = string
  }))

  default = [
    {
      name                 = "colabkids/frontend"
      image_tag_mutability = "MUTABLE"
    },
    {
      name                 = "colabkids/backend"
      image_tag_mutability = "MUTABLE"
  }]
}

variable "route53" {
  type = object({
    domain_name = string
    zone_id     = optional(string)
  })
  description = "Configurações do Route 53"
  default = {
    domain_name = "leandrospferreira.com.br"
  }
}
