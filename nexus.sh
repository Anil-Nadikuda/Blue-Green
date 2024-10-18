#!/bin/bash

# Function to display error message and exit if a command fails
exit_on_failure() {
  echo "Error: $1 failed."
  exit 1
}

# Step 1: Update system packages
echo "Updating system packages..."
sudo yum update -y || exit_on_failure "System update"

# Step 2: Install Docker
echo "Installing Docker..."
sudo yum install -y docker || exit_on_failure "Docker installation"

# Step 3: Start Docker service
echo "Starting Docker service..."
sudo systemctl start docker || exit_on_failure "Starting Docker service"

# Step 4: Enable Docker to start at boot
echo "Enabling Docker to start on boot..."
sudo systemctl enable docker || exit_on_failure "Enabling Docker at boot"

# Step 5: Add the RHEL user to the Docker group
echo "Adding current user to the Docker group..."
sudo usermod -aG docker $USER || exit_on_failure "Adding user to Docker group"

# Step 6: Restart Docker to apply group changes
echo "Restarting Docker service..."
sudo systemctl restart docker || exit_on_failure "Restarting Docker service"

# Step 7: Install Sonatype Nexus using Docker
echo "Pulling Nexus image from Docker Hub..."
sudo docker pull sonatype/nexus3 || exit_on_failure "Pulling Nexus image"

echo "Running Nexus container..."
sudo docker run -d -p 8081:8081 --name nexus -v /nexus-data:/nexus-data sonatype/nexus3 || exit_on_failure "Running Nexus container"

# Step 8: Wait for Nexus to initialize
echo "Waiting for Nexus to initialize (may take a couple of minutes)..."
sleep 30  # Adjust the sleep time if needed depending on the machine

# Step 9: Display the Nexus admin password
echo "Retrieving the Nexus admin password..."
NEXUS_PASSWORD=$(sudo cat /nexus-data/admin.password) || exit_on_failure "Retrieving Nexus password"
echo "Nexus admin password is: $NEXUS_PASSWORD"

# Step 10: Output access instructions
echo "Nexus is running on: http://localhost:8081"
echo "Login with username: admin and password: $NEXUS_PASSWORD"

