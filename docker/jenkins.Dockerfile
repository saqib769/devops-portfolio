# Use official Jenkins LTS image
FROM jenkins/jenkins:lts

USER root

# Install curl (if not installed), Node.js, npm
RUN apt-get update && apt-get install -y curl gnupg \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm \
    && apt-get clean

# Switch back to Jenkins user
USER jenkins