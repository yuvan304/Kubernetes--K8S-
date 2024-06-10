Kubernetes:(K8S)

structure: CNPCA

CLUSTER-->NODE-->POD-->CONTAINER-->APP

Kubernetes is doen't direct connect with CONTAINERS
 --> It doesn't know  there are exist even container was present in POD.
--> Kubernetes don't know about CONTAINERS.
--> Its communicates with only PODS.



COMPONENTS:
MASTER NODE:
1. API SERVER: Its for communicating with cluster, it takes command executes and gives output.
2. ETCD: Its a DB of our cluster , all the cluster info will store here.
3. SCHEDULERS: Its main theme is to give the task to ECTD the pods the created or not otherwise to create the PODS in worker node .
--> Based on hardware resources in workernode, which worker node has best hardware process.
4. CONTROLLER: Used to control the k8s objects.
--> i. cloud controllers
    ii. kube controllers

WORKER NODE:
KUBELET: Its an agent used to communicate with master.
KUBEPROXY: It deals with network.
POD: Its a group of CONTAINERS.

There are multiple ways to setup kubernetes cluster.

1.SELF MANAGER K8'S CLUSTER
a.mini kube (single node cluster)
b.kubeadm (multi node cluster)
c.KOPS

2.CLOUD MANAGED K8'S CLUSTER
a.AWS EKS
b.AZURE AKS
c.GCP GKS
d.IBM IKE


MINIKUBE:
It is a tool used to setup single node cluster on k8's.
It contains API SERVERS, ETDC database and CONTAINER runtime
It is used for development, testing, and experimentation purpose on local.
Here master and worker runs on same machine.
It is a platform Independent.

NOTE: But we don't implement this in realtime

REQUIREMENTS:
2 CPUs or more
2GB of free memory
20GB of free disk space
Internet connection
Container or virtual machine manager, such as: DOCKER.


MINIKUBE TO CREATE ON AWS CONSOLE: (using ubuntu)
apt update -y
apt upgarde -y
//update server


sudo apt install curl wget apt-transport-https -y
sudo curl -fsSL.https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
//install docker



sudo curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo mv minikube-linux-amd64 /usr/local/bin/minikube
sudo chmod +x /usr/local/bin/minikube
sudo minikube version
//install minikube



sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
sudo echo "$(cat kubectl.sha256) kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
sudo kubectl version --client
sudo kubectl version --client --output=yaml
sudo minikube start --driver=docker --force
//install kubectl


minikube status
//check the status after installation of kubectl




POD: Is a smallest unit of kubernetes

IMPERATIVE:

kubectl run pod1 --image yuvansai13/train:latest
//create a image


kubectl get pod
or
kubectl get po
or
kubectl get pods
//list of pods


kubectl describe pod pod1
//describe the pod

kubectl delete pod pod1
//delete

kubectl get po -o wide
//to read the info


DECLARATIVE:
vim abc.yml

apiversion: v1
kind: Pod
metadata:
   name: pod1
spec:
  containers:
    - name: cont1
      image: nginx

//save&exit

kubectl create -f abc.yml
//create a file 

kubectl get po
kubectl get po -o wide
kubectl describe pod pod1
kubectl delete pod pod1


DRAWBACK:
If we delete the pod we cannot retrive
All the load will be handled by single pod

REPLICA SET:
It will create same pod of multiple replicas
If we delete one pod it will create automatically
We can distribute the load also

LABEL: Assing to a pod for identification.
SELECTION: Used to identify the pod with same label

REPLICA SET:

apiVersion: apps/v1
kind: ReplaceSet
metadata:
  labels:
    app: swiggy
  name: swiggy-rs
spec:
  replicas: 3
  selector:
    matchLabels:
      app: swiggy
  template:
    metadata:
      labels:
        app: swiggy
    spec:
      containers:
      - name: cont1
        image: nginx

        
kubectl create -f abc.yml

kubectl get rs
//replica set

kubectl api-resources
