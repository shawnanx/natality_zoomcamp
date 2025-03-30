resource "google_storage_bucket" "bucket" {
  name     = var.bucket_name
  location = var.location
  storage_class = "STANDARD"
  uniform_bucket_level_access = true
  public_access_prevention = "enforced"
}