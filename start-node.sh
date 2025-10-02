#!/bin/bash
set -e

# ensure nexus CLI is in path
export PATH="/root/.nexus/bin:$PATH"

# Loop so it restarts if it exits/crashes
while true; do
  if [ -n "$NODE_ID" ]; then
    echo "Starting nexus-network with node id: $NODE_ID"
    nexus-network start --node-id "$NODE_ID"
  else
    echo "Starting nexus-network (no NODE_ID provided)"
    nexus-network start
  fi

  echo "Nexus exited with code $? -- restarting in 5s" >&2
  sleep 5
done
