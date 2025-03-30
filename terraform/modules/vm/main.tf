resource "google_compute_instance" "vm" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  service_account {
    email  = "terraform-service-account@${var.project_id}.iam.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

metadata_startup_script = <<-EOF
    #!/bin/bash
    set -e  # Exit on any error

    # Ensure system is ready before proceeding
    sleep 30
    sudo apt-get update

    # Retry apt-get in case of locked dpkg
    for i in {1..5}; do sudo apt-get install -y docker.io && break || sleep 10; done

    # Start and enable Docker
    sudo systemctl start docker
    sudo systemctl enable docker

    # Verify Docker is running
    if ! sudo systemctl is-active --quiet docker; then
      echo "Docker failed to start. Exiting."
      exit 1
    fi

    # Install Python and Pip
    sudo apt-get install -y python3 python3-pip

    # Upgrade pip and install dbt
    sudo python3 -m pip install --upgrade pip
    sudo python3 -m pip install dbt-core dbt-bigquery --break-system-packages

    # Add dbt to system-wide PATH
    echo 'export PATH=/root/.local/bin:$PATH' | sudo tee /etc/profile.d/dbt.sh
    source /etc/profile.d/dbt.sh

    # Verify dbt installation
    if ! command -v dbt &> /dev/null; then
      echo "dbt installation failed. Exiting."
      exit 1
    else
      echo "dbt installed successfully."
      dbt --version
    fi

    # Pull the Kestra image
    sudo docker pull kestra/kestra:latest

    # Remove existing Kestra container if it exists
    if sudo docker ps -a | grep -q kestra; then
      echo "Removing existing Kestra container..."
      sudo docker stop kestra
      sudo docker rm kestra
    fi

    # Run Kestra in standalone mode
    sudo docker run -d -p 8080:8080 --name kestra --restart unless-stopped kestra/kestra:latest server local

    # Verify Kestra container is running
    if sudo docker ps | grep -q kestra; then
      echo "Kestra container is running."
    else
      echo "Kestra container failed to start. Checking logs..."
      sudo docker logs kestra
      exit 1
    fi

    # Print success message
    echo "Setup complete! Kestra is running on http://<VM_IP>:8080/ui"
  EOF
}