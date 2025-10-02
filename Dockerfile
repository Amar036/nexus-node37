FROM ubuntu:22.04

# Install dependencies
RUN apt update && apt upgrade -y && \
    apt install -y curl git build-essential tmux htop

# Install Nexus CLI
RUN curl https://cli.nexus.xyz/ | sh

# Add Nexus CLI to PATH
ENV PATH="/root/.nexus/bin:$PATH"

# Start Nexus node with your node-id
CMD ["nexus-network", "start", "--node-id", "36552296"]
