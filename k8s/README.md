# ☸️ Kubernetes Deployment Documentation

This folder contains Kubernetes configuration files used to deploy and manage the application inside a Kubernetes cluster (Minikube).

---

## 📂 Folder Overview


k8s/
├── deployment.yaml
└── service.yaml


---

## 1. deployment.yaml

This file is responsible for defining how the application runs inside Kubernetes.

### What it does:

- Creates a Deployment
- Manages application Pods
- Ensures desired number of replicas are running
- Uses Docker image from Docker Hub

---

### Key Features:

- Defines container image (`saqib24/jenkins-deployment:latest`)
- Sets container port (5002)
- Automatically restarts failed Pods
- Handles scaling and updates

---

### Example Command:

```bash
kubectl apply -f k8s/deployment.yaml

2. service.yaml
This file exposes the application to external users.

What it does:

Creates a Kubernetes Service
Exposes application outside the cluster
Maps internal container port to external port

Service Type:
NodePort

This allows access via:

http://<node-ip>:<port>

Example Command:
kubectl apply -f k8s/service.yaml

How to Deploy Application:

Step 1: Start Minikube
minikube start

Step 2: Apply Kubernetes Configurations
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

Step 3: Check Running Resources
kubectl get pods
kubectl get services

Step 4: Access Application
minikube service <service-name>

OR manually:

http://localhost:<nodeport>

Useful Commands:
Check Pods
kubectl get pods
Check Services
kubectl get svc
Describe Resources
kubectl describe pod <pod-name>
View Logs
kubectl logs <pod-name>

Key Concepts Explained

🔹 Pod
Smallest unit in Kubernetes that runs your container.

🔹 Deployment
Manages Pods and ensures application is always running.

🔹 Service
Exposes your application to external users.

🔹 NodePort
Opens a port on the node to access the application.

Key Highlights:
Application deployed on Kubernetes (Minikube)
Uses Docker image from Docker Hub
Scalable and self-healing setup
Service-based external access
Production-like deployment structure

Summary

This Kubernetes setup allows:

Running containerized apps in a cluster
Managing application lifecycle automatically
Scaling and updating application easily
Exposing app to external users

