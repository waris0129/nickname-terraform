terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.24.0"
    }
  }
}

provider "google" {
  project     = "nickname-tf-run"
  region      = "us-central1"
  zone        = "us-central1-a"
  credentials = "keys.json"
}



resource "google_cloud_run_service" "nickname-run-tf-version" {
  
    name     = "tf-v1"
    location = "us-central1"
    template {
      spec {
            containers {
                image = "gcr.io/nickname-tf-run/java2:tf"
            }
      }
    }


}


resource "google_cloud_run_service_iam_policy" "pub_access" {
  service     = google_cloud_run_service.nickname-run-tf-version.name
  location    = google_cloud_run_service.nickname-run-tf-version.location
  policy_data = data.google_iam_policy.pub-1.policy_data
}

data "google_iam_policy" "pub-1" {
  binding {
    role    = "roles/run.invoker"
    members = ["allUsers", ]
  }
}






