variable "project_name" {
  type        = string
  description = "The name of the GCP project"
}

variable "project_id" {
  type        = string
  description = "The ID of the GCP project"
}

variable "org_id" {
  type        = string
  description = "The ID of the GCP organization"
}

variable "billing_account" {
  type        = string
  description = "The ID of the GCP billing account"
}

variable "repo_name" {
  type        = string
  description = "The name of the GCP repository"
}

variable "repo_sa_name" {
  type        = string
  description = "The name of the GCP service account for repository access"
}

variable "trigger_name" {
  type        = string
  description = "The name of the GCP Cloud Build trigger"
}

variable "branch_name" {
  type        = string
  description = "The name of the branch to trigger on"
}