# Deployemnt of Web Application on Cloud Run-TASK 1
This repository contains the source code for a React-based TODO application. The application can be deployed locally or on Google Cloud using a containerized environment.

# Table of content
- [Prerequisites](https://github.com/kawin048/CLOUD_TASK1/blob/main/README.md#prerequisites)
- [Overview](https://github.com/kawin048/CLOUD_TASK1/blob/main/README.md#overview)
- [Installation](https://github.com/kawin048/CLOUD_TASK1/blob/main/README.md#installation)
- [Local Deployment using DockerFile](https://github.com/kawin048/CLOUD_TASK1/blob/main/README.md#local-deployment-using-dockerfile)
- [App Deployment to Cloud Run on Google Cloud](https://github.com/kawin048/CLOUD_TASK1/blob/main/README.md#app-deployment-to-cloud-run-on-google-cloud)
- [Verifying the Deployment](https://github.com/kawin048/CLOUD_TASK1/blob/main/README.md#verifying-the-deployment)
- [Result](https://github.com/kawin048/CLOUD_TASK1/blob/main/README.md#Result)

# Prerequisites
- Google Cloud Account 
- GCP project with billing enabled.
- Docker installed on local machine and necessary permissions on Google cloud for deployment.

# Overview
1. Clone the source code from github
2. Test the app locally.
3. Build a Docker image and access the application on localhost.
4. Next, we build a Docker image on google cloud.
5. Push image to GCR.
6. Use cloud run service for deployment of this web app.
7. Access the app with url created by Cloud run.

# Installation
1.clone the repository from GitHub:
```bash
git clone https://github.com/kawin048/CLOUD_TASK1.git
```
2.Install dependencies:

```bash
npm install
```

3.Test the application:
```bash
npm start
```
# Local Deployment using DockerFile

1.Create a Dockerfile: Add the following Dockerfile to your project directory:

```bash

# Use an official Node runtime
FROM node:14

# Set the working directory
WORKDIR /app

# Copy the package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose port 80
EXPOSE 80

# Run the application
CMD ["node", "index.js"]

```
2.Build the Docker Image:

```bash
docker build -t My-Todo-App .
```
3.Run the Docker Container:
```bash 
docker run -d -p 8080:80 My-Todo-App

```
4. Access the Application:
   - Open a browser and go to http://localhost:8080 to see the application.

# App Deployment to Cloud Run on Google Cloud

1.Connect to Google Cloud from local using Cloudsdk.
2.Execute the command to connect to Google cloud and Project :
```bash
gcloud auth login
gcloud config set project <your-project-id>
gcloud config set compute/region "REGION"
LOCATION="Region"

```
3.Authenticate Docker with Google Cloud:
```bash
gcloud auth configure-docker
```
4.Enable Cloud Run and Cloud Build APIs:
```bash
gcloud services enable run.googleapis.com
gcloud services enable cloudbuild.googleapis.com
```
5.Build and submit the container image to Google Cloud:
```bash
gcloud builds submit --tag gcr.io/$GOOGLE_CLOUD_PROJECT/your-app-name
```
6. Verify the image in the Artifact Registry:   
```bash
gcloud container images list
```
7.Deploy to Google Cloud Run:
```bash
gcloud run deploy --image gcr.io/$GOOGLE_CLOUD_PROJECT/your-app-name --allow-unauthenticated --region=$LOCATION
```
8.Access the Application:
On successful deployment, the service URL will be displayed. Open this URL in your browser to use the application.

# Verifying the Deployment
- After deploying to Cloud Run, you should see a URL in your terminal, such as https://My-Todo-App-xxxxxx-uc.a.run.app. This is the public endpoint for your TODO application in the cloud.RS

# Result
After following all the steps and instructions outlined above, I successfully built and deployed a simple React To-Do application, now running on Google Cloud.

- TO ACCESS MY APPLICATION: [MY APPLICATION](https://cloud-task1-vm-454757820311.us-central1.run.app)


  





