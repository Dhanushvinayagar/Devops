# VM - Virtual Machine
# Has OS, Memory, Storage, Network, CPU,
# Use Kernel, Hypervisor,Application layer same as physical machine
# So, it takes a lot of memory nearly GB
# Hypervisor - Software that allows you to run multiple VMs on a single physical machine
# Need a dedicated RAM for each VM to run which will be splitted from host RAM

# Docker - Containerization
# It is a container platform to build,package, and run applications inside containers.
# It do not use Hypervisor. But yet it has some files of OS inside it to run containers
# Uses Application layer primaryly so it takes only MB of memory
# Uses RAM of the host machine OS

# Images - Templates/blueprints for containers to run
# Container - A running instance of an image

# Containerization is based on OS .
# Linux based container cannot run on Windows
# Docker is primarily used for Linux but can also be used for other operating systems.

# WHile pulling images it is pulled from Docker Hub 
# Docker Hub is a public repository for Docker images
# Images can also be pushed to Docker Hub
# Images are pulled by layers, it a new pulled image has the same file of any previous image, it will not be downloaded again.

# Docker Compose - It is a tool for defining and running multi-container docker applications


# check docker installed or not
docker --version

# docker images - list all images
docker images

# pull - pull an image from Docker Hub
# docker pull image_name
docker pull nginx

# docker remove image
docker rmi image_name

# docker ps - list all running containers
docker ps

# docker ps -a - list all containers, including stopped
docker ps -a

# docker run - run will create a container every time
# docker run image_name
docker run nginx 

# interactive terminal -  Give node cli
docker run -it node bash

# -d - detached
# -p - port
# Docker container port is not accessible from outside docker container, so we need to expose it using -p
docker run -d -p 80:80 nginx
# tag_name
docker run -d -p 8080:8000 --name my_app app    

# docker start - start a container but has to be created already using docker run
docker start container_id

# docker restart - restart a container
docker restart container_id

# Setting environment variables
# -e - environment
docker run -e ENV=production nginx

# docker logs
docker logs container_id

# docker logs -f - follow logs
# -f - follow (keeps following logs)
docker logs -f container_id

# docker stop - stop a running container
docker stop container_id

# docker rm - remove a container
docker rm container_id

# tag - add a tag to an image for identification
docker tag myapp my_custom_app

# commit - create a new image from a container
docker commit container_id new_image_name

# push - push an image to Docker Hub
# If no version is specified, the latest version will be pushed
# Better to specify the version
docker push image_name:v1

# inspect - inspect a container
docker inspect container_id

# exec - execute a command in a running container (interactive shell)
docker exec -it container_id  sh 
