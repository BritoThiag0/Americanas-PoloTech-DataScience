# **Google Cloud Fundamentals**

# Create and Manage Cloud Resources: Challenge Lab

> # First Scenario | Task 1. Create a project jumphost instance
>
> 1. No Console do Cloud, acessar o Menu de Navegação;
> 2. Selecionar _Compute Engine_ e, em seguida, _VM Instances_;
> 3. Selecionar _Create Instances_;
> 4. Alterar o nome da instância para o nome dado na TASK 1;
> 5. Não altere a região nem a zona;
> 6. Em _Series_, selecione a opção N1;
> 7. Em _Machine Type_, selecionar f1-micro;
> 8. Clicar em _Create Instance_;
> 9. Esperar carregar e verificar se a _task_ foi concluida;
> 10. Se sim, deletar a instância criada para não dar problema com a TASK 3;

---

> # Second Scenario | Task 2. Create a Kubernetes service cluster
>
> ## 1. Setup
>
> ```shell
> gcloud auth list
>
> gcloud config set compute/zone [ZONA DADA NA TASK 2]
>
> gcloud config set compute/region [REGIÃO DADA NA TASK 2]
> ```
>
> ## 2. Create a zonal cluster
>
> ```shell
> gcloud container clusters create [NOME DO CLUSTER] \
> 	--num-nodes 1 \
> 	--network nucleus-vpc \
> 	--zone [ZONA DADA NA TASK 2]
>
> gcloud container clusters get-credentials [NOME DO CLUSTER] \
> 	--zone [ZONA DADA NA TASK 2]
>
> ```
>
> ## 3. Use the Docker container hello-app as a placeholder
>
> ```shell
> kubectl create deployment hello-server \
> 	--image=gcr.io/google-samples/hello-app:2.0
> ```
>
> ## 4. Expose the app on a port
>
> ```shell
> kubectl expose deployment hello-server \
> 	--type=LoadBalancer \
> 	--port [PORTA DADA NA TASK 2]
>
> kubectl get service
> ```

---

> # Third Scenario | Task 3. Set up an HTTP load balancer
>
> ## 1. Setup
>
> ```shell
> gcloud auth list
> gcloud config set compute/zone us-east1-b
> gcloud config set compute/region us-east1
> ```
>
> ## 2. Create an instance template
>
> ```shell
> cat << EOF > startup.sh
> #! /bin/bash
> apt-get update
> apt-get install -y nginx
> service nginx start
> sed -i -- 's/nginx/Google Cloud Platform - '"\$HOSTNAME"'/' /var/www/html/index.nginx-debian.html
> EOF
>
> gcloud compute instance-templates create nginx-template \
>     --metadata-from-file startup-script=startup.sh
>     --network nucleus-vpc \
>     --machine-type g1-small
> ```
>
> ## 3. Create a target pool
>
> ```shell
> gcloud compute target-pools create nginx-pool
> ```
>
> ## 4. Create a managed instance group of 2 nginx web servers
>
> ```shell
> gcloud compute instance-groups managed create nginx-group \
> 	--base-instance-name nginx \
> 	--size 2 \
> 	--template nginx-template \
> 	--target-pool nginx-pool
>
> gcloud compute instances list
> ```
>
> ## 5. Create a firewall rule
>
> ```shell
> gcloud compute firewall-rules create [NOME DADO NA TASK 3] \
>     --allow tcp:80 \
>     --network nucleus-vpc
> ```
>
> ## 6. Create a forwarding rule
>
> ```shell
> gcloud compute forwarding-rules create nginx-lb \
> 	--region us-east1 \
> 	--ports=80 \
> 	--target-pool nginx-pool
>
> gcloud compute forwarding-rules list
> ```
>
> ## 7. Create a health check
>
> ```shell
> gcloud compute http-health-checks create http-basic-check
> ```
>
> ## 8. Create a backend service and attach the managed instasnce group
>
> ```shell
> gcloud compute instance-groups managed \
> 	set-named-ports nginx-group \
> 	--named-ports http:80
>
> gcloud compute backend-services create nginx-backend \
> 	--protocol HTTP \
> 	--health-checks http-basic-check \
> 	--global
>
> gcloud compute backend-services add-backend nginx-backend \
> 	--instance-group nginx-group \
> 	--instance-group-zone us-east1-b \
> 	--global
> ```
>
> ## 9. Create a url map and target the HTTP proxy
>
> ```shell
> gcloud compute url-maps create web-map \
> 	--default-service nginx-backend
>
> gcloud compute target-http-proxies create http-lb-proxy \
> 	--url-map web-map
> ```
>
> ## 10. Create a forwarding rule
>
> ```shell
> gcloud compute forwarding-rules create http-content-rule \
> 	--global \
> 	--target-http-proxy http-lb-proxy \
> 	--ports 80
>
> gcloud compute forwarding-rules list
> ```

---
