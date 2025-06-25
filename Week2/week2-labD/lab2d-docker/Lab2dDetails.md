Containerize a Simple Application with Docker and Deploy via CLI, Portal, and ARM Templates


Objective

    Install and verify Docker installation
    Create a simple Python web application
    Write a Dockerfile to containerize the app
    Build and run a Docker image locally
    Deploy containerized app to Azure Container Instance (ACI) using CLI, Portal, and ARM Template


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week2 (main) $ cd week2-labD
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@ranipriyanka-cloud ➜ /workspaces/priyanka-cloud-wil/Week2/week2-labD (main) $ docker --version
docker run hello-world
Docker version 28.1.1-1, build 4eba3773274f9d21ba90ae5bc719c3f1e4bb07a1

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@ranipriyanka-cloud ➜ .../priyanka-cloud-wil/Week2/week2-labD/lab2d-docker (main) $ docker run -p 5000:5000 flask-simple-app
 * Serving Flask app 'app'
 * Debug mode: off
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on all addresses (0.0.0.0)
 * Running on http://127.0.0.1:5000
 * Running on http://172.17.0.2:5000
Press CTRL+C to quit
172.17.0.1 - - [25/Jun/2025 12:49:21] "GET / HTTP/1.1" 200 -


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



![image](https://github.com/user-attachments/assets/2c0a6fbf-b839-4210-845e-e7bf7a94b411)











