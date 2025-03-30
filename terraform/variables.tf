variable "project_id" {
  type    = string
  default = "natality-data-project-dez-2"
}

variable "region" {
  type    = string
  default = "us-west1"
}

variable "credentials_file" {
  type    = string
  default = "../credentials/gcp-key.json"
}

variable "bucket_name" {
  type    = string
  default = "natality-data-bucket-2"
}

variable "location" {
  type    = string
  default = "US"
}

variable "dataset_id" {
  type    = string
  default = "natality_data"
}