output "project_id" {
  value       = google_project.project.project_id
  description = "The ID of the GCP project"
}

output "repo_name" {
  value       = google_sourcerepo_repository.repo.name
  description = "The name of the GCP repository"
}

output "repo_url" {
  value       = google_sourcerepo_repository.repo.url
  description = "The URL of the GCP repository"
}