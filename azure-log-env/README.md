# Configure log management in Azure

## Run terraform script to create Azure resources
```bash
./tfrun.sh init
./tfrun.sh plan
./tfrun.sh apply
```

## Set-up steps (on client)
To be automated ...
### Install Azure CLI
```bash
sudo curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

### Login Azure (with device)
```bash
az login --use-device-code
```

### Set Azure subscription
```bash
az account set --subscription "Visual Studio Professional"
```

### Create Azure service principal
Make sure Azure CLI is up to date.
```bash
az ad sp create-for-rbac --name sp-log-manager --role Contributor --scopes /subscriptions/f6ae6cad-fc7e-4f8a-852a-5a47a749ccab
```
### Onboard Azure Arc client
Generate script using portal or
```bash
# Download the installation package. Or use portal generated script (easier)
wget https://aka.ms/azcmagent -O ~/Install_linux_azcmagent.sh

# Install the Azure Connected Machine agent.
bash ~/Install_linux_azcmagent.sh
```

### Install Azure Monitor Agent
```bash
az connectedmachine extension create --name AzureMonitorLinuxAgent --publisher Microsoft.Azure.Monitor --type AzureMonitorLinuxAgent --machine-name linux-desktop --resource-group Homelab --enable-auto-upgrade true
```

### Add resource (associate) to data collection rule

## Uninstall (on client)
### Removing Azure Monitoring Agent 
```bash
az connectedmachine extension delete --name AzureMonitorLinuxAgent --machine-name linux-desktop --resource-group Homelab
```