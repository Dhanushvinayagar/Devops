# Usually the new data/file contents created inside docker will be deleted when container crashes
# Docker Volume - A persistent storage mechanism for containers.

# Volume cannot be mounted to running container so to make change we need to delete the container 
# and create a new one with the volume

# List all volumes
docker volume ls

# Inspect a volume
docker volume inspect sql_mysql_data

# create a volume
docker volume create my_node_volume

# delete a volume
docker volume rm my_node_volume

# Types:

# Volume mount:
# It is a way to store data inside docker container to persist it even if container crashes by saving it on host machine
# But it is hidden from user
# When container crashes we can relink the volume to a new container



# Bind mount
# It is a way to store data inside docker container to persist it even if container crashes by saving it on host machine
# But it is visible to user (Basically it is a file path of host machine)
# When container crashes we can relink the volume to a new container


# Mount a volume to a container
# Oly difference is that we need to use -v created volume for Volume but for Bind mount we need to use -v host file path

# For Volume cmd use this
docker run -d -p 8000:3000 -v my_node_volume:/app_data my_node_app
# Else for Bind mount
docker run -d -p 8000:3000 -v /Users/dhanush/Documents/infra/devops/docker/volume/bind_volume_data:/app_bind_data my_node_app

# files created inside the folder app_data will be preserved even when container crashes
docker start container_id
docker exec -it my_node_app sh
# It can be mounted to a new container for further use
cd ..
cd app_data
ls # if volume data is there it will be listed 
touch data.txt
echo "hello world" >> data.txt
exit
# create a image and then new container with volume , execute shell and place a data file, run/check and delete the container
docker stop container_id
docker rm container_id
# create a new image and then new container with samevolume , check the folder
# Redo the above steps starting from Mount a volume to a container