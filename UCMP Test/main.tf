# Create a new GCP project
resource "google_project" "project" {
  name            = var.project_name
  project_id      = var.project_id
  org_id          = var.org_id
  billing_account = var.billing_account
}

# Create a new GCP repository
resource "google_sourcerepo_repository" "repo" {
  name    = var.repo_name
  project = google_project.project.project_id
}

# Create a new GCP service account for repository access
resource "google_service_account" "repo_sa" {
  account_id = var.repo_sa_name
  project    = google_project.project.project_id
}

# Grant repository access to the service account
resource "google_sourcerepo_repository_iam_member" "repo_iam" {
  repository = google_sourcerepo_repository.repo.name
  role       = "roles/source.admin"
  member     = "serviceAccount:${google_service_account.repo_sa.email}"
  project    = google_project.project.project_id
}

# Create a new GCP Cloud Source Repository
resource "google_cloudbuild_trigger" "trigger" {
  name        = var.trigger_name
  description = "Push to ${var.repo_name} repository"
  project     = google_project.project.project_id

  trigger_template {
    branch_name = var.branch_name
    repo_name   = google_sourcerepo_repository.repo.name
  }

  build {
    step {
      name = "gcr.io/cloud-builders/gcloud"
      args = ["source", "repos", "clone", google_sourcerepo_repository.repo.name]
    }
  }
}