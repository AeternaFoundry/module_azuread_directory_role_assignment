variable "directory_role_assignments" {
  description = <<EOT
Map of directory_role_assignments, attributes below
Required:
    - principal_object_id
    - role_id
Optional:
    - app_scope_id
    - directory_scope_id
EOT

  type = map(object({
    principal_object_id = string
    role_id             = string
    app_scope_id        = optional(string)
    directory_scope_id  = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.directory_role_assignments : (
        can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.role_id))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.directory_role_assignments : (
        can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", v.principal_object_id))
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.directory_role_assignments : (
        v.app_scope_id == null || (length(v.app_scope_id) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.directory_role_assignments : (
        v.directory_scope_id == null || (length(v.directory_scope_id) > 0)
      )
    ])
    error_message = "must not be empty"
  }
}

