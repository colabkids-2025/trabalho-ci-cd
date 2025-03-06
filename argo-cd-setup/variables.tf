variable "environment" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
  default     = "development"
}

variable "region" {
  type    = string
  default = "us-east-1" # Região padrão definida como US East (Ohio).
}

# Variável para armazenar as tags padrão associadas aos recursos AWS.
variable "tags" {
  type = object({
    Project     = string # Nome do projeto.
    Environment = string # Ambiente (ex.: produção, desenvolvimento).
  })
  default = {
    Project     = "colabkids"   # Nome do projeto padrão.
    Environment = "development" # Ambiente padrão é produção.
  }
}

variable "argocd_namespace" {
  type    = string
  default = "argocd" # Namespace padrão para o ArgoCD.

}

variable "argocd_values_file" {
  type = string
}


variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
  default     = "eks-colabkids"
}
