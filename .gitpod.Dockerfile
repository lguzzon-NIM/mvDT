# More information: https://www.gitpod.io/docs/config-docker/
FROM gitpod/workspace-full

# Install custom tools, runtime, etc.
RUN sudo apt-get update \
    && sudo apt-get install -y \
        git-flow \
        jq \
    && sudo rm -rf /var/lib/apt/lists/*

# Apply user-specific settings
# ENV ...
