variable "company_name" {
  description = "Company name"
  type        = string
}

variable "domain" {
  description = "Company domain"
  type        = string
}

variable "ct_home_region" {
  description = "AWS Control Tower home region"
  type        = string
}

variable "tf_backend_secondary_region" {
  description = "AWS Terraform backend secondary region"
  type        = string
}

variable "environments" {
  description = "A list of environments to create accounts for"
  type        = list(object({
    name                     = string
    company                  = string
    domain                   = string
    environment_managed_ou   = string
    F_user                   = string
    L_user                   = string
  }))
}
