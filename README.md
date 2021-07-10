# Welcome to my Automated Sample App Deployment to Kubernetes

## My apologies that this is coming in late

Follow the steps below to build your EKS infrastructure with Terraform, use Jenkins pipeline to compile and deploy the app war file, build a tomcat Docker image to run Docker containers and deploy to cluster nodes
Pre-requistes:
Install AWS CLI
Install eksctl
Install kubectl
Jenkins Master and Slave configuration

Steps:
```bash
1. Configure your AWS environment on your terminal
aws configure


*you will be prompted for your access and secret keys, as well as your AWS region and output
```

```bash
2. Clone this repo locally
git clone https://github.com/chuka2003/MyMen-DemTestApp/
```

```bash
3. After cloning has been completed, change directory to the terraform repo folder
cd ~/MyMen-DemTestApp/terraformproject
```


4. Terraform initialization and apply
```bash 
terraform init
terraform apply -auto-approve

*Infrastructure creation may take up to 15 minutes
```

```bash
5. Create clusterrole as admin
kubectl create clusterrolebinding cluster-system-anonymous --clusterrole=cluster-admin --user=system:anonymous
```

```bash
6. Update kubeconfig file on local machine
aws eks update-kubeconfig --name devops-eks --region us-east-1
```

```bash
7. Copy kubeconfig file contents; can use the CAT command to view the contents, you will need it in step 9b
cat ~/.kube/config
```

```bash
8. ssh into your jenkins slave machine and run the following commands
sudo apt install maven -y
sudo apt install docker.io -y
sudo chmod 666 /var/run/docker.sock
```

```bash
9. Log into jenkins master and navigate to Global credentials
a. create credentials for your docker hub account. Enter the ID as "dockerhub"
b. create credentials for Kubernetes. Enter ID as "K8S" and paste the kubeconfig in the textbox provided
```

```bash
10. Copy the contents of jenkins file (Jenkinsfile-K8S) and create a new pipeline
a. Update your jenkins slave as necessary in the jenkins pipeline file
b. Update your docker hub user id in the jenkins pipeline file
```

```bash
11. Save your jenkins configuration and then proceed to build
```

```bash
12. Verify your deployment; run
kubectl get pods
kubectl get deployments
kubectl get svc
```

```bash
13. From the 'kubectl get svc', copy the node public dns address and attach ':8080/men-dem' at the end as below
http://master_or_worker_node_public_ipaddress:8080/men-dem

```

*Thank you for your patience


### Resources
1. https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_cluster
2. Console recorder for AWS (chrome extension)
3. Getting Started with EKS and Terraform https://www.youtube.com/watch?v=Qy2A_yJH5-o
4. https://kubernetes.io/docs/concepts/workloads/controllers/deployment/
5. https://www.coachdevops.com/2020/12/deploy-python-app-docker-container-into.html
6. https://stackoverflow.com/questions/54341432/deploy-war-in-tomcat-on-kubernetes/54343647
