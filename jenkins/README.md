🤖 Jenkins CI Pipeline Documentation

This folder contains the Jenkins pipeline configuration used to automate the build process of the application.

---

## Folder Overview


jenkins/
└── Jenkinsfile


---

## Jenkinsfile

The `Jenkinsfile` defines the CI pipeline using Jenkins Declarative Pipeline syntax.

It automates the process of building and preparing the application.

---

## Pipeline Stages

The pipeline consists of multiple stages:

---

### 🔹 1. Pull Code

- Fetches the latest code from the GitHub repository
- Ensures the pipeline always runs on updated code

---

### 2. Install Dependencies

- Runs `npm install`
- Installs all required Node.js packages

---

### 3. Build Application

- Builds the React application
- Prepares production-ready files

---

### 4. Docker Image Build (if configured)

- Builds Docker image of the application
- Tags image for deployment

---

### 5. Post Actions

- Displays build success/failure status
- Helps in debugging pipeline execution

---

## Example Pipeline Flow


Code Push → Jenkins Trigger → Build Process → Docker Image → Ready for Deployment

---

## Key Features

- Automated CI pipeline
- Stage-based execution
- Error handling and logging
- Easy to extend for CD (deployment)

---

## Jenkins Environment

Jenkins is running inside a Docker container with:

- Node.js installed
- npm available
- Docker support enabled

This allows Jenkins to:

Run JavaScript builds  
Execute CI pipelines  
Build Docker images  

---

## Why Jenkins?

- Automates repetitive tasks
- Reduces manual errors
- Provides pipeline visibility
- Industry-standard CI tool

---

## Key Highlights

- Declarative pipeline structure
- Automated build workflow
- Integration with GitHub
- Containerized Jenkins setup

---

## Summary

This Jenkins setup enables:

Continuous Integration (CI)  
Automated build process  
Faster development workflow  
Reliable and repeatable builds  
