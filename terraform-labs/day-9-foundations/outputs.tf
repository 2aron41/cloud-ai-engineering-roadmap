output "generated_identifier" {
  description = "Identifier Terraform would generate if the configuration were applied."
  value       = random_pet.lab_identifier.id
}
