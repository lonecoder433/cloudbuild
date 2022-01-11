variable "bucketnames" {
  type        = list(string)
  default     = ["test1","test2"]
}

variable "cloud_source_repos" {
  default = ["prod","test"]
}
variable "terraform_apply_branches" {
  description = "List of git branches configured to run terraform apply Cloud Build trigger. All other branches will run plan by default."
  type        = list(string)

  default = [
    "main","dev","prod"
  ]
}
variable "cloudbuild_plan_filename" {
  description = "Path and name of Cloud Build YAML definition used for terraform plan."
  type        = string
  default     = "cloudbuild-tf-plan.yaml"
}

variable "cloudbuild_apply_filename" {
  description = "Path and name of Cloud Build YAML definition used for terraform apply."
  type        = string
  default     = "cloudbuild-tf-apply.yaml"
}
variable "storage_bucket_labels" {
  description = "Labels to apply to the storage bucket."
  type        = map(string)
  default     = {}
}
variable "default_region" {
  description = "Default region to create resources where applicable."
  type        = string
  default     = "us-central1"
}