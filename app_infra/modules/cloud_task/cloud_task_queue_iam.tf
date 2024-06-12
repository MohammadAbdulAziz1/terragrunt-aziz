resource "google_cloud_tasks_queue_iam_binding" "binding" {
  project = var.project_id
  location = var.location
  name = google_cloud_tasks_queue.cloud_task.name
  role = var.iam_roles
  members = var.iam_members
  depends_on = [ google_cloud_tasks_queue.cloud_task ]
}