FROM ubuntu:22.04

# Install dependencies
RUN apt update && apt upgrade -y && \
    apt install -y curl git build-essential tmux htop ca-certificates

# Install Nexus CLI
RUN curl https://cli.nexus.xyz/ | sh

# Ensure CLI is in PATH
ENV PATH="/root/.nexus/bin:$PATH"

# Copy restart wrapper and make it executable
COPY start-node.sh /start-node.sh
RUN chmod +x /start-node.sh

# Start the wrapper (which will run nexus-network and auto-restart if it crashes)
CMD ["/start-node.sh"]
