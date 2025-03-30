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

module "vm" {
  source = "./modules/vm"
  vm_name      = var.vm_name
  zone         = var.zone
  machine_type = var.machine_type
  project_id   = var.project_id
}

module "firewall" {
  source = "./modules/firewall"
  project_id = var.project_id
}