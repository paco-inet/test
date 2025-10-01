#!/bin/bash
set -euo pipefail
sudo apt-get update -y
sudo apt-get install -y curl git build-essential ca-certificates unzip software-properties-common

# Node 24 via NodeSource
curl -fsSL https://deb.nodesource.com/setup_24.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v
npm -v

# .NET 8 SDK (Microsoft repo för Debian 12)
wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update -y
sudo apt-get install -y dotnet-sdk-8.0
dotnet --info | head -n 20

# Terraform
TF_VER=1.8.7
curl -fsSL https://releases.hashicorp.com/terraform/${TF_VER}/terraform_${TF_VER}_linux_amd64.zip -o terraform.zip
unzip terraform.zip
sudo mv terraform /usr/local/bin/
rm terraform.zip
terraform -version
