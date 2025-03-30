resource "google_compute_firewall" "allow_kestra" {
  name    = "allow-kestra-${var.project_id}"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = ["0.0.0.0/0"]
}