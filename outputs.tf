output "directory_role_assignments_id" {
  description = "Map of id values across all directory_role_assignments, keyed the same as var.directory_role_assignments"
  value       = { for k, v in azuread_directory_role_assignment.directory_role_assignments : k => v.id }
}
output "directory_role_assignments_app_scope_id" {
  description = "Map of app_scope_id values across all directory_role_assignments, keyed the same as var.directory_role_assignments"
  value       = { for k, v in azuread_directory_role_assignment.directory_role_assignments : k => v.app_scope_id }
}
output "directory_role_assignments_directory_scope_id" {
  description = "Map of directory_scope_id values across all directory_role_assignments, keyed the same as var.directory_role_assignments"
  value       = { for k, v in azuread_directory_role_assignment.directory_role_assignments : k => v.directory_scope_id }
}
output "directory_role_assignments_principal_object_id" {
  description = "Map of principal_object_id values across all directory_role_assignments, keyed the same as var.directory_role_assignments"
  value       = { for k, v in azuread_directory_role_assignment.directory_role_assignments : k => v.principal_object_id }
}
output "directory_role_assignments_role_id" {
  description = "Map of role_id values across all directory_role_assignments, keyed the same as var.directory_role_assignments"
  value       = { for k, v in azuread_directory_role_assignment.directory_role_assignments : k => v.role_id }
}

