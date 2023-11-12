#!/bin/bash

# Check if FREEDNS_URL is set
if [ -z "$FREEDNS_URL" ]; then
    echo "Error: The FREEDNS_URL environment variable is not set."
    exit 1
fi

echo "FreeDNS update script started."
echo "Update URL: $FREEDNS_URL"

while true; do
    # Updating FreeDNS
    echo "Updating FreeDNS..."
    wget -q --read-timeout=0.0 --waitretry=5 --tries=400 --background "$FREEDNS_URL"

    echo "Update sent. Sleeping for 30 minutes..."
    # Sleep for 30 minutes (1800 seconds)
    sleep 1800
done
