# k8s - kubernetes
# It is an orchestration tool.
# Kubernetes is an open source system for automating deployment, scaling and management of containerized applications.

# Cluster (Control plane + Worker nodes):
# A Kubernetes Cluster is a group of machines that maintain/run containerized applications.
    #             Control Plane
    #            ┌─────────────┐
    #            │ API Server  │
    #            │ Scheduler   │
    #            │ Controllers │
    #            │ ETCD        │
    #            └──────┬──────┘
    #                   │
    #          ┌────────┴────────┐
    #          │                 │
    #     Worker Node       Worker Node
    #    ┌─────────────┐   ┌─────────────┐
    #    │ Kubelet     │   │ Kubelet     │
    #    │ Kube Proxy  │   │ Kube Proxy  │
    #    │ Containers  │   │ Containers  │
    #    └─────────────┘   └─────────────┘


# Master node:- (Control plane)
# The Control Plane manages the entire Kubernetes cluster.
# Could be a single node or multiple nodes

# Components of control plane:
# 1. Api server (entry point of the Kubernetes cluster)
# - THe components in control plane and worker nodes are communicate with each other via this.
# - It is responsible for handling the requests
# - Accepts the requests from the user via kubectl 


# 2.Scheduler
# - The Scheduler is responsible for assigning pods to nodes.
# - Watches for newly created Pods
# - Selects the best node to run the pod

# 3.Controller manager
# - It is responsible for maintaining the state of the cluster
# - Compares the actual state of the cluster with the desired state
# - Actual state -> The current state of the cluster, Desired state -> The expected state of the cluster
# - Desired pods = 3 , Running pods = 2 then Controller informs the scheduler to create 1 more pod via api server 
# Types:
# 1. Replication controller - It is responsible for maintaining the pods via the desired state of the cluster
# 2. Deployment
# 3. Endpoints controller - It maintains the endpoints of the pods to maintian the ip address
# 4. Node controller

# 4. Etcd 
# - It stores the state of the cluster like desired state ,configuration
# - etcd is the key-value distributed database used by Kubernetes.

# Worker Node
# Controlled by the Master node
# Components of node:

# => POD
# It is a unit to run containers
# Containers inside a same pod share the same network namespace
# Each container has its own IP
# For communication between pods, ip addresses are used
# We can create multiple containers in a same pod (But for tight coupling apps)
# Because if a container is down, k8s will delete the whole pod and create a new one
# So the container at good state will also delete due to the container at bad state
# So for non related containers, we can create multiple pods


# =>Service:
# - When pod is down, k8s will delete the pod and create a new one. 
# - So,Pods have dynamic IP addresses, so they can change.
# - If one pod is connected to other pod directly, then when the pod is down, it will not be able to connect to new pod.

# - A Service provides a stable network ip endpoint.
# It forwards the requests to the kube proxy.

# | Service Type | Purpose                |
# | ------------ | ---------------------- |
# | ClusterIP    | Internal communication |
# | NodePort     | Access outside cluster |
# | LoadBalancer | External load balancer |
# | Headless     | Direct pod access      |

# Endpoint:
# - It maintains the endpoint of the service.
# - It manages the ip address of the service and the pods.

# 1. Kubelet
# - Kubelet is the agent running on every worker node.
# - It is responsible for running/monitoring the pods
# - API Server → Kubelet → Start container

# 2. Kube-proxy 
# - Kube-proxy manages network communication inside the cluster.
# - It is responsible for routing traffic/communication/network between pods
# - It is also responsible for load balancing the requests from Service.
# - It contains the service static ip addresses with dynamic ip addresses of pods through Endpoints
# - When request comes to kube-proxy, it routes the request to the container

# 3. Container runtime
# - Container Runtime is the software responsible for running containers.
# - Docker is the most popular container runtime

# 4. CRI (Container Runtime Interface)
# - CRI is the interface between Kubernetes and container runtime.
# - It allows Kubernetes to communicate with different container runtimes.



# Replica set:
# A ReplicaSet ensures that a specified number of pod replicas are running at all times.
# ReplicaSet = 3 pods
# If any pod is down, k8s will maintain the replica set by creating a new pod



# minikube
# It is a tool to run a local Kubernetes cluster
# It helps us to run a Kubernetes cluster both master and worker on our single local machine


# cmds:
# First install minikube for local kubernetes cluster then
# minikube start
# minikube status

# Check minikube 
# kubectl get nodes

# create a pod/replica set/...
# kubectl apply -f file_name.yml

# kubectl get pods 
# kubectl get pods -A
# kubectl describe pod pod_name

# kubectl delete pod pod_name

# kubectl get rs replicaset_name

# Do not use imperative way to create a replica set use the declarative way(yml file)
# kubectl scale rs replicaset_name --replicas=5

# kubectl delete rs replicaset_name

# minikube stop