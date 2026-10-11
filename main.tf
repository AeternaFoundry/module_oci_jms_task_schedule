resource "oci_jms_task_schedule" "jms_task_schedules" {
  for_each = var.jms_task_schedules

  execution_recurrences = each.value.execution_recurrences
  fleet_id              = each.value.fleet_id

  task_details {
    dynamic "add_installation_site_task_request" {
      for_each = each.value.task_details.add_installation_site_task_request != null ? [each.value.task_details.add_installation_site_task_request] : []
      content {
        dynamic "installation_sites" {
          for_each = add_installation_site_task_request.value.installation_sites != null ? add_installation_site_task_request.value.installation_sites : []
          content {
            artifact_content_type = installation_sites.value.artifact_content_type
            force_install         = installation_sites.value.force_install
            headless_mode         = installation_sites.value.headless_mode
            installation_path     = installation_sites.value.installation_path
            managed_instance_id   = installation_sites.value.managed_instance_id
            release_version       = installation_sites.value.release_version
          }
        }
        post_installation_actions = add_installation_site_task_request.value.post_installation_actions
      }
    }
    dynamic "crypto_task_request" {
      for_each = each.value.task_details.crypto_task_request != null ? [each.value.task_details.crypto_task_request] : []
      content {
        recording_duration_in_minutes = crypto_task_request.value.recording_duration_in_minutes
        dynamic "targets" {
          for_each = crypto_task_request.value.targets != null ? crypto_task_request.value.targets : []
          content {
            application_installation_key = targets.value.application_installation_key
            application_key              = targets.value.application_key
            container_key                = targets.value.container_key
            jre_key                      = targets.value.jre_key
            managed_instance_id          = targets.value.managed_instance_id
          }
        }
        waiting_period_in_minutes = crypto_task_request.value.waiting_period_in_minutes
      }
    }
    dynamic "deployed_application_migration_task_request" {
      for_each = each.value.task_details.deployed_application_migration_task_request != null ? [each.value.task_details.deployed_application_migration_task_request] : []
      content {
        dynamic "targets" {
          for_each = deployed_application_migration_task_request.value.targets != null ? deployed_application_migration_task_request.value.targets : []
          content {
            deployed_application_installation_key = targets.value.deployed_application_installation_key
            exclude_package_prefixes              = targets.value.exclude_package_prefixes
            include_package_prefixes              = targets.value.include_package_prefixes
            managed_instance_id                   = targets.value.managed_instance_id
            source_jdk_version                    = targets.value.source_jdk_version
            target_jdk_version                    = targets.value.target_jdk_version
          }
        }
      }
    }
    dynamic "java_migration_task_request" {
      for_each = each.value.task_details.java_migration_task_request != null ? [each.value.task_details.java_migration_task_request] : []
      content {
        dynamic "targets" {
          for_each = java_migration_task_request.value.targets != null ? java_migration_task_request.value.targets : []
          content {
            application_installation_key = targets.value.application_installation_key
            exclude_package_prefixes     = targets.value.exclude_package_prefixes
            include_package_prefixes     = targets.value.include_package_prefixes
            managed_instance_id          = targets.value.managed_instance_id
            source_jdk_version           = targets.value.source_jdk_version
            target_jdk_version           = targets.value.target_jdk_version
          }
        }
      }
    }
    dynamic "jfr_task_request" {
      for_each = each.value.task_details.jfr_task_request != null ? [each.value.task_details.jfr_task_request] : []
      content {
        jfc_profile_name              = jfr_task_request.value.jfc_profile_name
        jfc_v1                        = jfr_task_request.value.jfc_v1
        jfc_v2                        = jfr_task_request.value.jfc_v2
        recording_duration_in_minutes = jfr_task_request.value.recording_duration_in_minutes
        recording_size_in_mb          = jfr_task_request.value.recording_size_in_mb
        dynamic "targets" {
          for_each = jfr_task_request.value.targets != null ? jfr_task_request.value.targets : []
          content {
            application_installation_key = targets.value.application_installation_key
            application_key              = targets.value.application_key
            container_key                = targets.value.container_key
            jre_key                      = targets.value.jre_key
            managed_instance_id          = targets.value.managed_instance_id
          }
        }
        waiting_period_in_minutes = jfr_task_request.value.waiting_period_in_minutes
      }
    }
    dynamic "performance_tuning_task_request" {
      for_each = each.value.task_details.performance_tuning_task_request != null ? [each.value.task_details.performance_tuning_task_request] : []
      content {
        recording_duration_in_minutes = performance_tuning_task_request.value.recording_duration_in_minutes
        dynamic "targets" {
          for_each = performance_tuning_task_request.value.targets != null ? performance_tuning_task_request.value.targets : []
          content {
            application_installation_key = targets.value.application_installation_key
            application_key              = targets.value.application_key
            container_key                = targets.value.container_key
            jre_key                      = targets.value.jre_key
            managed_instance_id          = targets.value.managed_instance_id
          }
        }
        waiting_period_in_minutes = performance_tuning_task_request.value.waiting_period_in_minutes
      }
    }
    dynamic "remove_installation_site_task_request" {
      for_each = each.value.task_details.remove_installation_site_task_request != null ? [each.value.task_details.remove_installation_site_task_request] : []
      content {
        dynamic "installation_sites" {
          for_each = remove_installation_site_task_request.value.installation_sites != null ? remove_installation_site_task_request.value.installation_sites : []
          content {
            installation_key    = installation_sites.value.installation_key
            managed_instance_id = installation_sites.value.managed_instance_id
          }
        }
      }
    }
    dynamic "scan_java_server_task_request" {
      for_each = each.value.task_details.scan_java_server_task_request != null ? [each.value.task_details.scan_java_server_task_request] : []
      content {
        managed_instance_ids = scan_java_server_task_request.value.managed_instance_ids
      }
    }
    dynamic "scan_library_task_request" {
      for_each = each.value.task_details.scan_library_task_request != null ? [each.value.task_details.scan_library_task_request] : []
      content {
        dynamic_scan_duration_in_minutes = scan_library_task_request.value.dynamic_scan_duration_in_minutes
        is_dynamic_scan                  = scan_library_task_request.value.is_dynamic_scan
        managed_instance_ids             = scan_library_task_request.value.managed_instance_ids
      }
    }
    task_type = each.value.task_details.task_type
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

