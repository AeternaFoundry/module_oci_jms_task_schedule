variable "jms_task_schedules" {
  description = <<EOT
Map of jms_task_schedules, attributes below
Required:
    - execution_recurrences
    - fleet_id
    - task_details (block):
        - add_installation_site_task_request (optional, block):
            - installation_sites (optional, block):
                - artifact_content_type (optional)
                - force_install (optional)
                - headless_mode (optional)
                - installation_path (optional)
                - managed_instance_id (optional)
                - release_version (optional)
            - post_installation_actions (optional)
        - crypto_task_request (optional, block):
            - recording_duration_in_minutes (optional)
            - targets (optional, block):
                - application_installation_key (optional)
                - application_key (optional)
                - container_key (optional)
                - jre_key (optional)
                - managed_instance_id (optional)
            - waiting_period_in_minutes (optional)
        - deployed_application_migration_task_request (optional, block):
            - targets (optional, block):
                - deployed_application_installation_key (optional)
                - exclude_package_prefixes (optional)
                - include_package_prefixes (optional)
                - managed_instance_id (optional)
                - source_jdk_version (optional)
                - target_jdk_version (optional)
        - java_migration_task_request (optional, block):
            - targets (optional, block):
                - application_installation_key (optional)
                - exclude_package_prefixes (optional)
                - include_package_prefixes (optional)
                - managed_instance_id (optional)
                - source_jdk_version (optional)
                - target_jdk_version (optional)
        - jfr_task_request (optional, block):
            - jfc_profile_name (optional)
            - jfc_v1 (optional)
            - jfc_v2 (optional)
            - recording_duration_in_minutes (optional)
            - recording_size_in_mb (optional)
            - targets (optional, block):
                - application_installation_key (optional)
                - application_key (optional)
                - container_key (optional)
                - jre_key (optional)
                - managed_instance_id (optional)
            - waiting_period_in_minutes (optional)
        - performance_tuning_task_request (optional, block):
            - recording_duration_in_minutes (optional)
            - targets (optional, block):
                - application_installation_key (optional)
                - application_key (optional)
                - container_key (optional)
                - jre_key (optional)
                - managed_instance_id (optional)
            - waiting_period_in_minutes (optional)
        - remove_installation_site_task_request (optional, block):
            - installation_sites (optional, block):
                - installation_key (optional)
                - managed_instance_id (optional)
        - scan_java_server_task_request (optional, block):
            - managed_instance_ids (optional)
        - scan_library_task_request (optional, block):
            - dynamic_scan_duration_in_minutes (optional)
            - is_dynamic_scan (optional)
            - managed_instance_ids (optional)
        - task_type (required)
Optional:
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    execution_recurrences = string
    fleet_id              = string
    task_details = object({
      add_installation_site_task_request = optional(object({
        installation_sites = optional(list(object({
          artifact_content_type = optional(string)
          force_install         = optional(bool)
          headless_mode         = optional(bool)
          installation_path     = optional(string)
          managed_instance_id   = optional(string)
          release_version       = optional(string)
        })))
        post_installation_actions = optional(list(string))
      }))
      crypto_task_request = optional(object({
        recording_duration_in_minutes = optional(number)
        targets = optional(list(object({
          application_installation_key = optional(string)
          application_key              = optional(string)
          container_key                = optional(string)
          jre_key                      = optional(string)
          managed_instance_id          = optional(string)
        })))
        waiting_period_in_minutes = optional(number)
      }))
      deployed_application_migration_task_request = optional(object({
        targets = optional(list(object({
          deployed_application_installation_key = optional(string)
          exclude_package_prefixes              = optional(list(string))
          include_package_prefixes              = optional(list(string))
          managed_instance_id                   = optional(string)
          source_jdk_version                    = optional(string)
          target_jdk_version                    = optional(string)
        })))
      }))
      java_migration_task_request = optional(object({
        targets = optional(list(object({
          application_installation_key = optional(string)
          exclude_package_prefixes     = optional(list(string))
          include_package_prefixes     = optional(list(string))
          managed_instance_id          = optional(string)
          source_jdk_version           = optional(string)
          target_jdk_version           = optional(string)
        })))
      }))
      jfr_task_request = optional(object({
        jfc_profile_name              = optional(string)
        jfc_v1                        = optional(string)
        jfc_v2                        = optional(string)
        recording_duration_in_minutes = optional(number)
        recording_size_in_mb          = optional(number)
        targets = optional(list(object({
          application_installation_key = optional(string)
          application_key              = optional(string)
          container_key                = optional(string)
          jre_key                      = optional(string)
          managed_instance_id          = optional(string)
        })))
        waiting_period_in_minutes = optional(number)
      }))
      performance_tuning_task_request = optional(object({
        recording_duration_in_minutes = optional(number)
        targets = optional(list(object({
          application_installation_key = optional(string)
          application_key              = optional(string)
          container_key                = optional(string)
          jre_key                      = optional(string)
          managed_instance_id          = optional(string)
        })))
        waiting_period_in_minutes = optional(number)
      }))
      remove_installation_site_task_request = optional(object({
        installation_sites = optional(list(object({
          installation_key    = optional(string)
          managed_instance_id = optional(string)
        })))
      }))
      scan_java_server_task_request = optional(object({
        managed_instance_ids = optional(list(string))
      }))
      scan_library_task_request = optional(object({
        dynamic_scan_duration_in_minutes = optional(number)
        is_dynamic_scan                  = optional(bool)
        managed_instance_ids             = optional(list(string))
      }))
      task_type = string
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.jms_task_schedules : (
        contains([for v in ["ADD_INSTALLATION_SITE", "CRYPTO", "DEPLOYED_APPLICATION_MIGRATION", "JAVA_MIGRATION", "JFR", "PERFORMANCE_TUNING", "REMOVE_INSTALLATION_SITE", "SCAN_JAVA_SERVER", "SCAN_LIBRARY"] : lower(v)], lower(v.task_details.task_type))
      )
    ])
    error_message = "must be one of: \"ADD_INSTALLATION_SITE\", \"CRYPTO\", \"DEPLOYED_APPLICATION_MIGRATION\", \"JAVA_MIGRATION\", \"JFR\", \"PERFORMANCE_TUNING\", \"REMOVE_INSTALLATION_SITE\", \"SCAN_JAVA_SERVER\", \"SCAN_LIBRARY\""
  }
}

