# HINT: use `terraform plan` & `terraform apply` to create the resources

# DONE: Create a google_storage_bucket 
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket

# DONE: Create an IAM binding with the role Storage Object User and yourself as the member
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam

# DONE: Create a data source for a GCS Bucket and use following bucket: hack-and-heat-2024-task-5
# A data source allows Terraform to use information defined outside of Terraform, in this case our already exisiting bucket in the GCP project.
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/storage_bucket

# DONE: Upload Readme.md to the bucket you fetched above with your data source. Use your name as a prefix for the storage bucket object resource.
# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_object

# Create a google_storage_bucket 
resource "google_storage_bucket" "meineimer" {
  name          = "florianseimer"
  location      = "EU"
  force_destroy = true

#   uniform_bucket_level_access = true
#   website {
#     main_page_suffix = "index.html"
#     not_found_page   = "404.html"
#   }
#   cors {
#     origin          = ["http://image-store.com"]
#     method          = ["GET", "HEAD", "PUT", "POST", "DELETE"]
#     response_header = ["*"]
#     max_age_seconds = 3600
#   }
}

resource "google_storage_bucket_iam_binding" "binding" {
  bucket = google_storage_bucket.meineimer.name
  role = "roles/storage.admin"
  members = [
    "user:florian.motz@senacor.com",
  ]
}

# Create a data source for a GCS Bucket and use following bucket: hack-and-heat-2024-task-5
data "google_storage_bucket" "hack-and-heat-2024-task-5" {
  name = "hack-and-heat-2024-task-5"
}

# resource "google_storage_bucket_object" "picture" {
#   name   = "butterflyyyy"
#   source = "README.md"
#   bucket = "hack-and-heat-2024-task-5"
# }