variable "project_id" {
  type    = string
  default = "natality-data-project-dez"
}

variable "region" {
  type    = string
  default = "us-west1"
}

variable "credentials_file" {
  type    = string
  default = "C:/Users/shawn/.gcp/terraform-key.json"
}

variable "bucket_name" {
  type    = string
  default = "natality-data-bucket"
}

variable "location" {
  type    = string
  default = "US"
}

variable "dataset_id" {
  type    = string
  default = "natality_data"
}

variable "vm_name" {
  type    = string
  default = "kestra-instance"
}

variable "zone" {
  type    = string
  default = "us-west1-a"
}

variable "machine_type" {
  type    = string
  default = "e2-standard-16"
}