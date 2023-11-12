# Use a minimal Ubuntu base image
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Install wget (and ca-certificates for HTTPS support)
RUN apt-get update && \
    apt-get install -y wget ca-certificates && \
    rm -rf /var/lib/apt/lists/*

# Define build-time argument for FreeDNS URL
ARG FREEDNS_URL

# Set environment variable from build argument
ENV FREEDNS_URL=$FREEDNS_URL

# Add your update script to the container
COPY updater.sh .

# Make the script executable
RUN chmod +x updater.sh

# Command to run the script
CMD ["./updater.sh"]
