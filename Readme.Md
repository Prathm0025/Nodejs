# Next.js Frontend and Node.js Backend Project

## Overview

This project is a full-stack application consisting of a Next.js frontend and a Node.js backend. The frontend is hosted on port 80 using Nginx, and both the frontend and backend are containerized using Docker.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- **Docker**: [Install Docker](https://docs.docker.com/get-docker/) on your machine to run the application in containers.
- **Docker Compose**: [Install Docker Compose](https://docs.docker.com/compose/install/) to manage multi-container Docker applications.

## Deployment

To deploy the application, follow these steps:

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/your_username/your_repository_name.git
   cd your_repository_name```

2.  **Build and Run the Containers**:

To build and run the Docker containers, execute the following command:

```bash
docker-compose up --build
```
## Access the Application:

*Frontend*: Open your web browser and navigate to http://localhost. The Next.js frontend will be accessible on port 80.
#Stopping the Application:

To stop the running containers, use:

```bash
docker-compose down
```
