az group create --name lab2ca-rg --location australiaeast

![image](https://github.com/user-attachments/assets/475f27f5-a662-4630-978f-ff00eb0d41cc)

read -s -p "Enter VM admin password: " VM_PASS; echo
az vm create \
  --resource-group lab2c-rg \
  --name lab2c-ubuntu-vm \
  --image Ubuntu2204 \
  --size Standard_B1s \
  --admin-username azureuser \
  --admin-password "$VM_PASS" \
  --authentication-type password \
  --output json

  
![image](https://github.com/user-attachments/assets/f5ff9b23-0f6e-45c3-b48e-2e0181ab8d95)
