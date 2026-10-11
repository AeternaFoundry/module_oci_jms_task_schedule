output "jms_task_schedules_id" {
  description = "Map of id values across all jms_task_schedules, keyed the same as var.jms_task_schedules except keys with no id are omitted"
  value       = { for k, v in oci_jms_task_schedule.jms_task_schedules : k => v.id if v.id != null && length(v.id) > 0 }
}
output "jms_task_schedules_created_by" {
  description = "Map of created_by values across all jms_task_schedules, keyed the same as var.jms_task_schedules except keys with no created_by are omitted"
  value       = { for k, v in oci_jms_task_schedule.jms_task_schedules : k => v.created_by if v.created_by != null && length(v.created_by) > 0 }
}
output "jms_task_schedules_execution_recurrences" {
  description = "Map of execution_recurrences values across all jms_task_schedules, keyed the same as var.jms_task_schedules except keys with no execution_recurrences are omitted"
  value       = { for k, v in oci_jms_task_schedule.jms_task_schedules : k => v.execution_recurrences if v.execution_recurrences != null && length(v.execution_recurrences) > 0 }
}
output "jms_task_schedules_fleet_id" {
  description = "Map of fleet_id values across all jms_task_schedules, keyed the same as var.jms_task_schedules except keys with no fleet_id are omitted"
  value       = { for k, v in oci_jms_task_schedule.jms_task_schedules : k => v.fleet_id if v.fleet_id != null && length(v.fleet_id) > 0 }
}
output "jms_task_schedules_name" {
  description = "Map of name values across all jms_task_schedules, keyed the same as var.jms_task_schedules except keys with no name are omitted"
  value       = { for k, v in oci_jms_task_schedule.jms_task_schedules : k => v.name if v.name != null && length(v.name) > 0 }
}
output "jms_task_schedules_state" {
  description = "Map of state values across all jms_task_schedules, keyed the same as var.jms_task_schedules except keys with no state are omitted"
  value       = { for k, v in oci_jms_task_schedule.jms_task_schedules : k => v.state if v.state != null && length(v.state) > 0 }
}
output "jms_task_schedules_task_details" {
  description = "Map of task_details values across all jms_task_schedules, keyed the same as var.jms_task_schedules except keys with no task_details are omitted"
  value       = { for k, v in oci_jms_task_schedule.jms_task_schedules : k => one(v.task_details) if v.task_details != null && length(v.task_details) > 0 }
}
output "jms_task_schedules_time_created" {
  description = "Map of time_created values across all jms_task_schedules, keyed the same as var.jms_task_schedules except keys with no time_created are omitted"
  value       = { for k, v in oci_jms_task_schedule.jms_task_schedules : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "jms_task_schedules_time_last_run" {
  description = "Map of time_last_run values across all jms_task_schedules, keyed the same as var.jms_task_schedules except keys with no time_last_run are omitted"
  value       = { for k, v in oci_jms_task_schedule.jms_task_schedules : k => v.time_last_run if v.time_last_run != null && length(v.time_last_run) > 0 }
}
output "jms_task_schedules_time_last_updated" {
  description = "Map of time_last_updated values across all jms_task_schedules, keyed the same as var.jms_task_schedules except keys with no time_last_updated are omitted"
  value       = { for k, v in oci_jms_task_schedule.jms_task_schedules : k => v.time_last_updated if v.time_last_updated != null && length(v.time_last_updated) > 0 }
}
output "jms_task_schedules_time_next_run" {
  description = "Map of time_next_run values across all jms_task_schedules, keyed the same as var.jms_task_schedules except keys with no time_next_run are omitted"
  value       = { for k, v in oci_jms_task_schedule.jms_task_schedules : k => v.time_next_run if v.time_next_run != null && length(v.time_next_run) > 0 }
}

