output "key_vault_id" {
  value = module.kv.id
}

output "kv_vault_uri" {
  value = module.kv.vault_uri
}

output "storage_lrs_id" {
  value = module.sa_lrs_cc.id
}

output "storage_ragrs_id" {
  value = module.sa_ragrs_ce.id
}