terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.37.0"
    }
  }
}

provider "google" {
  project = "m5-demand-forecast"
  region = "southamerica-east1"
  credentials = "m5-demand-forecast-service-account-keys.json"
}

resource "google_storage_bucket" "m5_bucket" {
  name = "m5-demand-forecast-amc"
  region = "southamerica-east1	"
  
  lifecycle {
    prevent_destroy = true # Evita a destruição acidental do bucket
  }
}

resource "google_bigquery_dataset" "m5_dataset" {
  dataset_id = "m5_dataset"
  location = "southamerica-east1"
}

resource "google_bigquery_table" "m5_dataset" {
	
}