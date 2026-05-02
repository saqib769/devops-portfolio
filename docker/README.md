# Docker Setup Documentation

This directory contains all Docker-related configurations used to containerize the application and run Jenkins as a CI server.

---

## Folder Overview


docker/
├── Dockerfile
├── jenkins.Dockerfile
└── docker-compose.yml


---

## 1. Dockerfile (Application Image)

This `Dockerfile` is responsible for building the Docker image of the React application.

### What it does:

- Uses Node.js as base image
- Installs project dependencies
- Copies application source code
- Runs the application using Vite

### Build Image

```bash
docker build -t saqib24/jenkins-deployment:latest -f Dockerfile ..
Run Container
docker run -p 5002:5002 saqib24/jenkins-deployment:latest

2. jenkins.Dockerfile (Custom Jenkins Image)

This file creates a custom Jenkins Docker image with additional tools required for CI/CD pipelines.

What it does:
Uses official Jenkins base image
Switches to root user to install tools
Installs Node.js and npm
Enables Jenkins to run JavaScript-based builds (React apps)
Prepares Jenkins for CI/CD pipelines

Key Configuration:

FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y curl gnupg \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm \
    && apt-get clean

USER jenkins
Why this is needed?

The default Jenkins image does not include:

Node.js
npm
Frontend build tools

This customization allows Jenkins to:

Run npm install
Build React applications
Execute CI pipelines without dependency issues

3. docker-compose.yml (Multi-Container Setup)

This file is used to manage and run services using Docker Compose.

What it includes:

Jenkins service configuration
Custom Jenkins image build
Port mapping (Jenkins UI access)
Volume setup for persistent Jenkins data
Docker socket binding (to allow Jenkins to run Docker commands)
How to Run the Project
Build and Start Services
docker compose up -d
Stop Services
docker compose down
Check Running Containers
docker ps
Access Points
Jenkins Dashboard
http://localhost:8080
React Application
http://localhost:5002

Jenkins in Docker (Important Concept)

Jenkins is running inside a Docker container instead of being installed directly on the host machine.

Benefits:
Consistent environment
Easy setup & portability
No host dependency issues
Easy to rebuild and scale
Supports containerized CI/CD workflows
Docker Socket Usage
/var/run/docker.sock

This allows Jenkins container to:

Build Docker images
Run Docker commands
Act as a CI server for containerized apps

Key Highlights:

Containerized application using Docker
Custom Jenkins setup inside Docker
CI-ready environment with Node.js support
Multi-container orchestration using Docker Compose
Seamless integration with CI/CD pipelines

Summary

This Docker setup enables:

Application containerization
Jenkins-based CI automation
Docker image creation and management
Consistent and portable development environment