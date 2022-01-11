# locals {
#    apply_branches_regex        = "^(${join("|", var.terraform_apply_branches)})$"
# }

resource "google_storage_bucket" "cloudbuild_artifacts" {
  for_each                    = toset(var.bucketnames)
  project                     = "bcm-pcidss-sai"
  name                        = format("%s-%s", "bcm-pcidss-sai", each.value)
  location                    = var.default_region
  labels                      = var.storage_bucket_labels
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
}
# resource "google_cloudbuild_trigger" "main_trigger" {
#   for_each    = toset(var.cloud_source_repos)
#   project     = "bcm-pcidss-sai"
#   description = "${each.value} - terraform apply."

#   trigger_template {
#     branch_name = local.apply_branches_regex
#     repo_name   = each.value
#   }

#   substitutions = {
#     _DEFAULT_REGION       = var.default_region
#     _STATE_BUCKET_NAME    = "gcp_test_terraform_test"
#     # _ARTIFACT_BUCKET_NAME = google_storage_bucket.cloudbuild_artifacts.name
#     _TF_ACTION            = "apply"
#   }

#   filename = var.cloudbuild_apply_filename
# }

# /***********************************************
#  Cloud Build - Non Main branch triggers
#  ***********************************************/

# resource "google_cloudbuild_trigger" "non_main_trigger" {
#   for_each    = toset(var.cloud_source_repos)
#   project     = "bcm-pcidss-sai"
#   description = "${each.value} - terraform plan."

#   trigger_template {
#     invert_regex = true
#     branch_name  = local.apply_branches_regex
#     repo_name    = each.value
#   }

#   substitutions = {
#     _DEFAULT_REGION       = var.default_region
#     _STATE_BUCKET_NAME    = "gcp_test_terraform_test"
#     _ARTIFACT_BUCKET_NAME = google_storage_bucket.cloudbuild_artifacts.name
#     _TF_ACTION            = "plan"
#   }

#   filename = var.cloudbuild_plan_filename
# }
