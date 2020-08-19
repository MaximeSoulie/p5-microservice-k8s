#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=msoulie/p5-microservice-k8s:latest

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment udacity-p5mk8 --image=$dockerpath
sleep 10

# Step 3:
# List of kubernetes pods
echo "#########################################"
kubectl get pods
echo "#########################################"

# Step 4 : get deployment
echo "#########################################"
kubectl get deployments
echo "#########################################"

# Step 5:
# Forward the container port to a host (random port with minikube)
echo "#########################################"
kubectl expose deployment udacity-p5mk8 --type=LoadBalancer --port=80
echo "#########################################"

# Step 6:
###View the service just created
echo "#########################################"
kubectl get services
echo "#########################################"

# Step 7:
# Running on Minikube (linux) need to expose port from VM to host
minikube service udacity-p5mk8
