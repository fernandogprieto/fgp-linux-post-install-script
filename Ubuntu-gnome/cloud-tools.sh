#!/bin/bash

#  ________    ______  _______    
# |_   __  | .' ___  ||_   __ \   Fernando G. Prieto
#   | |_ \_|/ .'   \_|  | |__) |  https://www.fernandogprieto.com/
#   |  _|   | |   ____  |  ___/   https://github.com/fernandogprieto
#  _| |_    \ `.___]  |_| |_      https://twitter.com/fernandogprieto 
# |_____|    `._____.'|_____| 
#
# Script created for personal use.
# last update: 2023-11-04
# Cloud Engineer Tools Scripts -  https://www.fernandogprieto.com/projects/

# ---------------------------------------------------------------------------- #

# --------------------------------- VARIABLE---------------------------------- #

GREEN='\e[32m'
BLUE='\e[34m'
YELLOW='\033[0;33m'
CLEAR='\e[0m'
RED='\033[0;31m'
NC='\033[0m'

# ---------------------------------------------------------------------------- #
function docker-stable(){
	docker_v=$(docker version --format '{{.Server.Version}}')
	if ! command -v docker &> /dev/null; then
		echo -e "$RED Docker is not installed. Installing Docker... $CLEAR"
		
		curl -fsSL https://get.docker.com -o get-docker.sh
		sudo sh get-docker.sh
		sudo usermod -aG docker $USER
		rm -rf get-docker.sh
	
		echo -e "$GREEN Docker ($docker_v) The program has been installed correctly.$CLEAR"
	else
		echo -e "$YELLOW  The installation of Docker ($docker_v) already exists.$CLEAR"
	fi	
}

function kubectl-stable(){
	kubectl_v=$(kubectl version --client | grep '^Client Version:' | awk '{print $3}')
	if ! command -v kubectl &> /dev/null; then
		echo -e "$RED Kubectl is not installed. Installing Kubectl... $CLEAR"
		
		curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
 		sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
		rm -rf kubectl
		
		echo -e "$GREEN Kubectl ($kubectl_v) The program has been installed correctly.$CLEAR"
	else
		echo -e "$YELLOW  The installation of Kubectl($kubectl_v) already exists.$CLEAR"
	fi	
}

function minikube-stable(){
	minikube_v=$(minikube version --short)
	if ! command -v minikube &> /dev/null; then
		echo -e "$RED Minikube is not installed. Installing Minikube... $CLEAR"

		curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 
  		chmod +x minikube
		sudo install minikube /usr/local/bin/
		rm -rf minikube

		echo -e "$GREEN Minikube ($minikube_v) The program has been installed correctly. $CLEAR"
	else
		echo -e "$YELLOW  The installation of Minikube ($minikube_v) already exists.$CLEAR"
	fi
}

function helm-stable() { 
	helm_v=$(helm version --short)
	if ! command -v helm &> /dev/null; then
		echo -e "$RED Helm is not installed. Installing Helm... $CLEAR"
		
		curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
 		chmod 700 get_helm.sh
		./get_helm.sh
		rm -rf get_helm.sh

        echo -e "$GREEN Helm ($helm_v) The program has been installed correctly.$CLEAR"
    else
        echo -e "$YELLOW  The installation of Helm ($helm_v) already exists.$CLEAR"
	fi
}

function argocd-stable(){ 
	argocd_v=$(argocd version --client --short)
	if ! command -v argocd &> /dev/null; then
		echo -e "$RED ArgoCD is not installed. Installing ArgoCD.$CLEAR"

		curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
		sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
		rm argocd-linux-amd64
		
		echo -e "$GREEN ArgoCD has been installed successfully.$CLEAR"
	else
		echo -e "$YELLOW  The installation of Argo ($argocd_v) already exists.$CLEAR"
	fi
}

function terraform-stable(){
	terraform_v=$(terraform --version | grep -oP '(?<=Terraform v)\d+\.\d+\.\d+')
	if ! command -v terraform &> /dev/null; then
		echo -e "$RED Terraform is not installed. Installing Terraform.$CLEAR"

		curl -s -o terraform_1.6.3_linux_amd64.zip https://releases.hashicorp.com/terraform/1.6.3/terraform_1.6.3_linux_amd64.zip
		unzip terraform_1.6.3_linux_amd64.zip
		sudo mv terraform /usr/local/bin/
		sleep 3
		rm -rf terraform_1.6.3_linux_amd64.zip
	
		echo -e "$GREEN Terraform has been installed successfully.$CLEAR"
	else
		echo -e "$YELLOW  The installation of Terraform ($terraform_v) already exists.$CLEAR"
	fi
}

function gcloud-cli-stable(){
	gcloud_v=$(gcloud --version | grep 'Google Cloud SDK' | awk '{print $4}')
	if ! command -v gcloud &> /dev/null; then
		echo -e "$RED Gcloud is not installed. Installing Gcloud.$CLEAR"

		echo "deb [signed-by=/usr/share/keyrings/cloud.google.asc] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
		curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
		curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo tee /usr/share/keyrings/cloud.google.asc
		sudo apt-get update 
		sudo apt-get install google-cloud-cli
	
		echo -e "$GREEN Gcloud has been installed successfully.$CLEAR"
	else
		echo -e "$YELLOW  The installation of Gcloud ($gcloud_v) already exists.$CLEAR"
	fi
}

function aws-cli-stable(){
	aws_cli_v=$(aws --version)
	if ! command -v aws &> /dev/null; then
		echo -e "$RED AWS-CLI is not installed. Installing AWS-CLI.$CLEAR"

		curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
		unzip awscliv2.zip
		sudo ./aws/install
		rm -rf ./aws && rm -f awscliv2.zip

		echo -e "$GREEN AWS-CLI has been installed successfully.$CLEAR"
	else
		echo -e "$YELLOW  The installation of AWS-CLI ($aws_cli_v) already exists.$CLEAR"
	fi
}

function azure-cli-stable(){ 
	azure_v=$(az --version | grep -oP 'azure-cli\s+\K\d+\.\d+\d+')
		if ! command -v az &> /dev/null; then
		echo -e "$RED AZURE-CLI is not installed. Installing AZURE-CLI.$CLEAR"

			curl -sLS https://packages.microsoft.com/keys/microsoft.asc |
		gpg --dearmor |
		sudo tee /etc/apt/keyrings/microsoft.gpg > /dev/null
		sudo chmod go+r /etc/apt/keyrings/microsoft.gpg
				
		#AZ_DIST=$(lsb_release -cs)
		echo "deb [arch=`dpkg --print-architecture` signed-by=/etc/apt/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/azure-cli/ jammy main" |
			sudo tee /etc/apt/sources.list.d/azure-cli.list
		sudo apt-get update
        sudo apt-get install azure-cli

		echo -e "$GREEN AZURE-CLI has been installed successfully.$CLEAR"
	else
		echo -e "$YELLOW  The installation of AZURE-CLI ($azure_v) already exists.$CLEAR"
	fi
}

function inst-cloud-tools { 
docker-stable
kubectl-stable
argocd-stable
helm-stable
minikube-stable
terraform-stable
gcloud-cli-stable
aws-cli-stable
azure-cli-stable
}

inst-cloud-tools
