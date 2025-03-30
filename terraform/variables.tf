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