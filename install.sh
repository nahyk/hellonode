#!/bin/sh
 
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

curl -o config https://$GITHUB_ACCESS_TOKEN@raw.githubusercontent.com/GithubOrganization/MySecretInfrastructureRepo/master/.kube/config

mkdir ${HOME}/.kube
cp config ${HOME}/.kube/config

kubectl config set clusters.default.certificate-authority-data "$KUBE_CLUSTER_CERTIFICATE"
kubectl config set users.default.username "$KUBE_CLIENT_CERTIFICATE"
kubectl config set users.default.password "$KUBE_CLIENT_KEY"
