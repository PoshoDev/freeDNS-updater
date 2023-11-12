# Use a lightweight base image
FROM alpine:latest

# Set the working directory
WORKDIR /app

# Install wget
RUN apk --no-cache add wget

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
