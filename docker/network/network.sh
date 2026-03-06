# Docker network
# It is a way to connect multiple containers together
# But doing this various containers will be able to communicate with each other

# We can also create custom network 
# Containers inside custom network will be able to communicate with each other
# Containers outside custom network will not be able to communicate with containers outside custom network
#  Outside container communication can be done via shared container
# It is like a bridge between containers

# Types:
#1. Bridge - docker0
# docker0 is the default network bridge
# the containers are connected to it will get ip address of the range between the ip range of docker0
# The containers will get assgined to docker0 network if we didn't specify any custom network

# Custom network
# the containers are connected to it will get ip address of the range between the ip range of custom network

#2. Host - 
# It is a way to connect containers directly to host network without any network bridge
# There is high chance of port conflict

#3. None -
# The containers are not connected to any network
# Cannot communicate with other containers and not with any network

# Example: DB ,BE,FE should be in the same/connectable network to communicate with each other

# Commands:
docker network ls

docker network inspect network_name

# Check bridge network
docker network inspect bridge #Check config - subnet
docker inspect container_id # Check Networks - network_name

# Create a custom network
docker network create network_name

docker network create A
docker network create B


# Create a container with custom network directly
docker run -d --name my_node_app --network network_name
docker run -d --name my_node_app --network A 
docker run -d --name my_app --network A --network B image_name

# Connect a running container to a custom network
docker network connect network_name container_id

# Delete a custom network
docker network rm network_name