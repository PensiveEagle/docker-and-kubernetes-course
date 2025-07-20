

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
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
  </ol>
</details>

## About the Project
This section project is designed to help me learn how to configure and manage the network connections within the Kubernetes cluster, including cluster external connections, inter-pod connections, and intra-pod connections.

This will be achieved using the following architecture:
![Architecture](/docs/images/kub-network-architecture.png)

The project consists of three backend APIs working together from different containers and pods.

The Auth API generates and verifies tokens for authenticated users.

The Users API creates users and allows them to login and recieve tokens from the Auth API

All of this is done with dummy data, so no database or data files are needed. This is done because this project is about connecting services together, not storing data.

The Tasks API allows authenticated users to store and retrieve a list of tasks, tasks are stored in a container internal file (again for storage simplicity). The Tasks API receives a token from the users and reaches out to the Auth API to verify the user's token.

A Docker Compose file is provided to run the system without the need of Kubernetes. Upon deletion of the Docker containers or Kubernetes Pods or Cluster all data will be deleted as no volumes are used in the project.

<strong>The node.js code in this project was provided through the <a href="#" target="_blank">Learn Docker, Docker Compose, Multi-Container Projects, Deployment and all about Kubernetes from the ground up!</a> Udemy Course, and was not authored by myself. Any edits I have made will be marked with comments!</strong>

### Built With
[![Node][Node.js]][Node-url]
[![Docker][docker-shield]][docker-url]
[![Kubernetes][kubernetes-shield]][kubernetes-url]

## Getting Started

### Prerequisites


### Installation


## Usage






<!-- ----- Links ----- -->
[product-screenshot]: images/screenshot.png
[Node.js]: https://img.shields.io/badge/node.js-5FA04E?style=for-the-badge&logo=nodedotjs&logoColor=white
[Node-url]: https://nodejs.org/
[docker-shield]: https://img.shields.io/badge/docker-2496ED?style=for-the-badge&logo=docker&logoColor=white
[docker-url]: https://www.docker.com/
[kubernetes-shield]: https://img.shields.io/badge/kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white
[kubernetes-url]: https://kubernetes.io/