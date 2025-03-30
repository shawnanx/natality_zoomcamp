provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file(var.credentials_file)
}

module "storage" {
  source = "./modules/storage"
  bucket_name = var.bucket_name
  location    = var.location
}

module "bigquery" {
  source = "./modules/bigquery"
  project_id = var.project_id
  dataset_id = var.dataset_id
  location   = var.location
}