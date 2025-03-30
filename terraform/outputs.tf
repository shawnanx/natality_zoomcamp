output "bucket_name" {
  value = module.storage.bucket_name
}

output "dataset_id" {
  value = module.bigquery.dataset_id
}

output "vm_public_ip" {
  value = module.vm.vm_public_ip
}