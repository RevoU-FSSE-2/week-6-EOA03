# Weekly Assignment 6

## INTRODUCTION

This week, the assignment is about making a simple node.js application and running it using a Docker container.

## THINGS NEEDED

Before we start making the simple node.js, you need to prepare some things.
- Install [Docker](https://www.docker.com/)
- Copy code from [github](https://gist.github.com/berdoezt/e51718982926f0caa3fcd8ed45111430)

### Steps to install Docker

1. Go to [Docker](https://www.docker.com/) and click download.
   ![Docker](https://github.com/RevoU-FSSE-2/week-6-EOA03/blob/main/documentation/1.PNG)
2. After you're done downloading, open the installer and start installing the Docker.
   ![Install Docker](https://github.com/RevoU-FSSE-2/week-6-EOA03/blob/main/documentation/2.PNG)
3. After you're done installing, it will tell you to update the WSL.
   ![Docker require](https://github.com/RevoU-FSSE-2/week-6-EOA03/blob/main/documentation/3.PNG)
   To update the WSL, open your CLI and type ```wsl --update```. After you update your WSL, you can check if your Docker is ready to use or not by typing ```docker -v``` or ```docker --version``` at your CLI.
   ![Update WSL](https://github.com/RevoU-FSSE-2/week-6-EOA03/blob/main/documentation/4.PNG)
   And you are ready to use Docker.
   ![Docker ready](https://github.com/RevoU-FSSE-2/week-6-EOA03/blob/main/documentation/5.PNG)

### Steps to make a node.js until run it using a Docker container.

1. Open VSCode, clone the repository from GitHub to your local storage, open the folder, and create a new file named ```app.js```.
2. Copy the simple node.js project from github [https://gist.github.com/berdoezt/e51718982926f0caa3fcd8ed45111430](https://gist.github.com/berdoezt/e51718982926f0caa3fcd8ed45111430) and paste it into your VSCode ```app.js```.
3. Create a new file named package.json that contains some information about the project.
   ```
   {
    "name": "web_app",
    "version": "1.0.0",
    "description": "Node.js on Docker",
    "author": "ester",
    "main": "app.js",
    "scripts": {
      "start": "node server.js"
    },
    "dependencies": {
      "express": "^4.18.2"
    }
    }
   ```
4. Create a new file named ```Dockerfile``` that contains:
   * ```FROM``` : define from what image we want to build from.
   * ```WORKDIR``` : a directory to hold the application code inside the image.
   * ```COPY``` : copy files from the directory.
   * ```RUN``` : execute commands to build image.
   * ```EXPOSE``` : ports where the container will listen.
   * ```CMD``` : commands to run the container.
    ```
    FROM node:bookworm

    WORKDIR /W6

    COPY . .

    RUN npm install

    EXPOSE 3001

    CMD ["node", "app.js"]
    ```
5. After creating the dockerfile, we are going to build the project using CLI. Open your CLI and use the command: ```docker build. -t web_app```.
   * ```docker build``` : to build an image using Docker.
   * ```.``` : specify the current directory to build Docker image.
   * ```-t``` : tag to your image to easily find it.
   * ```web_app``` : name of the Docker image.
    ![Build Docker image](https://github.com/RevoU-FSSE-2/week-6-EOA03/blob/main/documentation/6.png)
6. After we build the image, we need to run the image on the CLI by using the command : ```docker run -p 3001:3001 web_app:latest```.
   * ```docker run``` : to run the image.
   * ```-p 3001:3001``` : redirect local port to private port inside the container.
   * ```web_app``` : name of the image.
   * ```:latest``` : refer the latest version of the image.
    ![Run Docker image](https://github.com/RevoU-FSSE-2/week-6-EOA03/blob/main/documentation/7.png)
7. When it is already running, the container will appear in Docker Desktop.
   ![Running in Docker Desktop](https://github.com/RevoU-FSSE-2/week-6-EOA03/blob/main/documentation/8.png)
8. Result
   ![Result](https://github.com/RevoU-FSSE-2/week-6-EOA03/blob/main/documentation/9.PNG)
