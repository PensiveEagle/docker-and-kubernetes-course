

# Kubernetes Networking Project (Section 14)
This section's project is about networking in Kubernetes!

## Contents
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#docker">Docker</a>
          <ul>
            <li><a href="#prerequisites">Prerequisites</a></li>
            <li><a href="#installation">Installation</a></li>
          </ul>
        </li>
        <li><a href="#kubernetes">Kubernetes</a>
          <ul>
            <li><a href="#prerequisites">Prerequisites</a></li>
            <li><a href="#installation">Installation</a></li>
          </ul>
        </li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a>
      <ul>
        <li><a href="#docker-usage">Docker Usage</a></li>
        <li><a href="#kubernetes-usage">Kubernetes Usage</a></li>
      </ul>
    </li>
  </ol>
</details>

## About the Project
This section project is designed to help me learn how to configure and manage the network connections within the Kubernetes cluster, including cluster external connections, inter-pod connections, and intra-pod connections.

This will be achieved using the following architecture:
![Architecture](/docs/images/kub-network-architecture.svg)

The project consists of three backend APIs working together from different containers and pods.

The Auth API generates and verifies tokens for authenticated users.

The Users API creates users and allows them to login and recieve tokens from the Auth API

All of this is done with dummy data, so no database or data files are needed. This is done because this project is about connecting services together, not storing data.

The Tasks API allows authenticated users to store and retrieve a list of tasks, tasks are stored in a container internal file (again for storage simplicity). The Tasks API receives a token from the users and reaches out to the Auth API to verify the user's token.

A Docker Compose file is provided to run the system without the need of Kubernetes. Upon deletion of the Docker containers or Kubernetes Pods or Cluster all data will be deleted as no volumes are used in the project.

<strong>The node.js code in this project was provided through the <a href="#" target="_blank">Learn Docker, Docker Compose, Multi-Container Projects, Deployment and all about Kubernetes from the ground up!</a> Udemy Course, and was not authored by myself. Any edits I have made will be marked with comments!</strong>

### Built With
[![Node][Node.js-shield]][Node-url]
[![Docker][docker-shield]][docker-url]
[![Kubernetes][kubernetes-shield]][kubernetes-url]

## Getting Started
There are two ways to use this projects using Docker on your local machine or using Kubernetes

### Docker
#### Prerequisites
To run the project using Docker on your local machine you will need to have Docker installed - <a href="https://docs.docker.com/get-started/get-docker/" target="_blank">Get Started with Docker</a>

#### Installation
##### Step 1. 
Navigate to the project location of `docker-compose.yaml` in your terminal of choice
##### Step 2. 
Run
```sh
docker compose up -d --build
```

### Kubernetes
#### Prerequisites
In order to run this system in Kubernetes you need an existing Kubernetes cluster connected to `kubectl` accessible via a terminal.

For local development try <a href="https://minikube.sigs.k8s.io/docs/start/?arch=%2Fwindows%2Fx86-64%2Fstable%2F.exe+download" target="_blank">Minikube</a>

#### Installation
##### Step 1.
Build all container images and push them to an online container registry
```sh
cd kub-network

docker build -t < registry-account-name >/< repository-name >:users-api-1 ./users-api

docker build -t < registry-account-name >/< repository-name >:tasks-api-1 ./task-api

docker build -t < registry-account-name >/< repository-name >:auth-api-1 ./auth-api

docker push < registry-account-name >/< repository-name >:users-api-1

docker push < registry-account-name >/< repository-name >:tasks-api-1

docker push < registry-account-name >/< repository-name >:auth-api-1
```

##### Step 2.
Update the image names in the deployment yaml files under `containers` for each API. For example, in `kubernetes/users-deployment.yaml`:
```yaml
...
  containers:
    - name: < container-name >
      image: < registry-account-name >/< repository-name >:users-api-1
...
```

##### Step 3.
Apply deployment definitions to the Kubernetes Cluster
```sh
kubectl apply -f="kubernetes/users-deployment.yaml" -f="kubernetes/auth-deployment.yaml" -f="kubernetes/tasks-deployment.yaml"
```

##### Step 4.
Apply service definitions to the Kubernetes Cluster
```sh
kubectl apply -f="kubernetes/users-service.yaml" -f="kubernetes/tasks-service.yaml" -f="kubernetes/auth-service.yaml"
```

## Usage
### Docker Usage
##### Step 1. 
You should be able to reach each of the applications through a client (e.g <a href="https://www.postman.com/" target="_blank">Postman</a>)
##### Step 2. 
To reach the Users API you can send a POST request to `localhost:8080/login` with some dummy creds, such as 
```json
{
  "email": "test@test.com",
  "password": "testers"
}
```
This will return a token in a json document
##### Step 3.
You can send tasks to the Tasks API by sending a POST request to `localhost:8000/tasks`

Adding an "Authorization" header key with a value of "Bearer abc"

And a body of content, like the following:

```json
{
  "text": "A task!",
  "title": "Do this!"
}
```
##### Step 4.
You can retrieve tasks from the Tasks API by sending a get request to `localhost:8000/tasks`

Adding an "Authorization" header key with a value of "Bearer abc"

<strong>NOTE: This will return an error if no tasks have previously been added to the task list via a POST request detailed in Step 3.</strong>

### Kubernetes Usage
##### Step 0.
<strong>ONLY IF USING MINIKUBE</strong><br />
Run the Minikube command to expose the Load Balancer services:
```sh
minikube service users-service
minikube service tasks-service
```
(If you are using the Docker driver for Minikube then a tunnel is required and you will need to run these commands in separate terminals.)

This command should return the IP addresses each service can be reached on
##### Step 1. 
You should be able to reach each of the applications through a client (e.g <a href="https://www.postman.com/" target="_blank">Postman</a>)
##### Step 2. 
To reach the Users API you can send a POST request to `<users-service-url>/login` with some dummy creds, such as 
```json
{
  "email": "test@test.com",
  "password": "testers"
}
```
This will return a token in a json document
##### Step 3.
You can send tasks to the Tasks API by sending a POST request to `<tasks-service-url>/tasks`

Adding an "Authorization" header key with a value of "Bearer abc"

And a body of content, like the following:

```json
{
  "text": "A task!",
  "title": "Do this!"
}
```
##### Step 4.
You can retrieve tasks from the Tasks API by sending a get request to `<tasks-service-url>/tasks`

Adding an "Authorization" header key with a value of "Bearer abc"

<strong>NOTE: This will return an error if no tasks have previously been added to the task list via a POST request detailed in Step 3.</strong>





<!-- ----- Links ----- -->
[product-screenshot]: images/screenshot.png
[Node.js-shield]: https://img.shields.io/badge/node.js-5FA04E?style=for-the-badge&logo=nodedotjs&logoColor=white
[Node-url]: https://nodejs.org/
[docker-shield]: https://img.shields.io/badge/docker-2496ED?style=for-the-badge&logo=docker&logoColor=white
[docker-url]: https://www.docker.com/
[kubernetes-shield]: https://img.shields.io/badge/kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white
[kubernetes-url]: https://kubernetes.io/