# 🚀 DevOps End-to-End CI/CD Project

A complete real-world DevOps project implementing **CI/CD pipelines using GitHub Actions, Jenkins, Docker, and Kubernetes (Minikube)**.

This project demonstrates how code moves from development → containerization → deployment automatically.

---

## Project Goal

To build a fully automated pipeline where:

 Developer pushes code to GitHub  
 Docker image automatically builds  
 Image is pushed to Docker Hub  
 Application is deployed on Kubernetes (Minikube)

---

## Tech Stack

- React (Frontend Application)
- Docker (Containerization)
- Kubernetes (Minikube Cluster)
- Jenkins (CI Pipeline)
- GitHub Actions (CI/CD Automation)
- Ubuntu Linux
- Docker Hub (Image Registry)

---

## System Architecture

Developer Push Code
↓
GitHub Repository
↓
CI/CD Pipeline Trigger
├── GitHub Actions
└── Jenkins Pipeline
↓
Docker Image Build
↓
Docker Hub Push
↓
Kubernetes Deployment (Minikube)
↓
Application Running 🚀


---

## Project Structure


devops-portfolio/
│
├── docker/
│ ├── Dockerfile
│ └── docker-compose.yml
│
├── k8s/
│ ├── deployment.yaml
│ └── service.yaml
│
├── .github/
│ └── workflows/
│ └── docker.yml
│
├── src/
├── public/
├── package.json
└── README.md


---

## 🚀 CI/CD Pipeline (GitHub Actions)

Whenever code is pushed to `main` branch:

### Pipeline Steps:
1. Checkout Code from GitHub
2. Login to Docker Hub
3. Build Docker Image
4. Push Image to Docker Hub

---

## ⚡ GitHub Actions Workflow

```yaml
name: Build and Push Docker Image

on:
  push:
    branches:
      - main

jobs:
  docker:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Code
        uses: actions/checkout@v3

      - name: Login to Docker Hub
        uses: docker/login-action@v3
        with:
          username: ${{ secrets.DEVOPS }}
          password: ${{ secrets.DEVOPSPASS }}

      - name: Build Docker Image
        run: docker build -t saqib24/jenkins-deployment:latest -f docker/Dockerfile .

      - name: Push Docker Image
        run: docker push saqib24/jenkins-deployment:latest
 
 Jenkins CI Pipeline:

Jenkins is running inside a Docker container, making the setup portable and consistent across environments.

This containerized Jenkins setup handles the complete CI process.

Jenkins Responsibilities:

Pulls latest code from GitHub repository
Installs project dependencies
Executes build process
Builds Docker image inside container environment
Automates CI pipeline execution
Jenkins Docker Setup (Important)

Jenkins is deployed as a Docker container:

docker run -d -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts

Or using custom Docker image:

custom-jenkins-node (with Node.js + Docker installed)

Why Jenkins in Docker?

Easy setup & portability
No dependency issues on host machine
Consistent CI environment
Easy to recreate or scale


Jenkins is not installed directly on OS
It is running as a containerized CI server

SHORT VERSION (if you want one line)

Jenkins is running inside a Docker container with Node.js and Docker support enabled for CI automation.

Docker Workflow:

Docker is used to containerize the application for consistent deployment across environments.

Build Docker Image
docker build -t saqib24/jenkins-deployment:latest -f docker/Dockerfile .
Run Container
docker run -p 5002:5002 saqib24/jenkins-deployment:latest

Kubernetes Deployment:

Kubernetes is used to deploy and manage the containerized application.

Deploy Application
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
Check Running Resources
kubectl get pods
kubectl get services
Docker Hub Image

The final Docker image is pushed to Docker Hub for versioning and deployment:

saqib24/jenkins-deployment:latest


This project showcases a complete real-world DevOps pipeline, including:

Continuous Integration & Continuous Deployment (CI/CD)
Docker-based containerization
Kubernetes orchestration
Automated build & deployment workflow
Real production-like DevOps architecture

Key Highlights:

Fully automated CI/CD pipeline (no manual deployment)
Integration of GitHub Actions + Jenkins
Docker Hub as central image registry
Kubernetes-based deployment system
Production-style DevOps workflow simulation
Designing CI/CD pipelines
Docker image lifecycle & containerization
Kubernetes fundamentals (Pods, Services, Deployments)
Jenkins pipeline automation
GitHub Actions workflow automation
Real-world DevOps practices and architecture

Future Improvements:

Add Helm charts for Kubernetes
Add monitoring (Prometheus + Grafana)
Deploy on cloud (AWS / GCP / Azure)
Add rollback strategy in CI/CD
Add load balancing & scaling

Author:
Muhammad Saqib
Aspiring DevOps Engineer 🚀

Support

If you like this project:

⭐ Star the repo
🔗 Share on LinkedIn
🤝 Connect with me

Final Note

This project is built for learning real-world DevOps workflows and understanding how modern CI/CD pipelines work in production environments.
